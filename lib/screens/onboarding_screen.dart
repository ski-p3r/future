import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future/constants/colors.dart';
import 'package:future/constants/onboarding_text.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color activeColor = Theme.of(context).brightness == Brightness.dark
        ? MainColors.darkActive
        : MainColors.active;

    final Color textColor = Theme.of(context).brightness == Brightness.dark
        ? MainColors.text
        : MainColors.darkText;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemCount: Onboard.demo_data.length,
                  itemBuilder: (context, index) => OnboardingComponent(
                    onboard: Onboard.demo_data[index],
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                      Onboard.demo_data.length,
                      (index) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: DotIndicator(
                              isActive: index == _pageIndex,
                            ),
                          )),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(
                          curve: Curves.ease,
                          duration: Duration(milliseconds: 300),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: activeColor,
                        iconColor: textColor,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/right-arrow1.svg',
                        color: textColor,
                        width: 54,
                        height: 54,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key, this.isActive = false}) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final Color activeColor = Theme.of(context).brightness == Brightness.dark
        ? MainColors.darkActive
        : MainColors.active;

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 12,
      width: isActive ? 64 : 12,
      decoration: BoxDecoration(
        color: isActive ? activeColor : activeColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class Onboard {
  final String image, title, description;

  Onboard({
    required this.image,
    required this.title,
    required this.description,
  });

  static final List<Onboard> demo_data = [
    Onboard(
      image: OnboardingText.firstImage,
      title: OnboardingText.firstHead,
      description: OnboardingText.firstSub,
    ),
    Onboard(
      image: OnboardingText.secondImage,
      title: OnboardingText.secondHead,
      description: OnboardingText.secondSub,
    ),
    Onboard(
      image: OnboardingText.thirdImage,
      title: OnboardingText.thirdHead,
      description: OnboardingText.thirdSub,
    ),
  ];
}

class OnboardingComponent extends StatelessWidget {
  const OnboardingComponent({
    Key? super.key,
    required this.onboard,
  });

  final Onboard onboard;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Spacer(),
          Image.asset(
            onboard.image,
            height: 250,
            fit: BoxFit.contain, // Ensure the image fits within its container
          ),
          Spacer(),
          Text(
            onboard.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 28),
          ),
          SizedBox(height: 16),
          Text(
            onboard.description,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w100,
                  fontSize: 14,
                ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
