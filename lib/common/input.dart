import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future/constants/colors.dart';

class Input extends StatefulWidget {
  const Input({
    Key? key,
    required this.name,
    required this.placeholder,
    required this.keyboardType,
    required this.textInputAction,
    required this.controller,
    this.isSecure = false,
    this.prefix = '',
    this.suffix = '',
    this.borderWidth = 1.0,
  }) : super(key: key);

  final String name;
  final String placeholder;
  final String prefix;
  final String suffix;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final bool isSecure;
  final double borderWidth;

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  late FocusNode _focusNode;
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color textColor = Theme.of(context).brightness == Brightness.dark
        ? MainColors.darkText
        : MainColors.text;

    final Color inputBgColor = Theme.of(context).brightness == Brightness.dark
        ? MainColors.darkBoxColor
        : MainColors.boxColor;
    final Color placeholderColor =
        Theme.of(context).brightness == Brightness.dark
            ? MainColors.pDarkText
            : MainColors.pText;

    Widget? suffixIcon;
    if (widget.isSecure) {
      suffixIcon = GestureDetector(
        onTap: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            _isPasswordVisible
                ? 'assets/icons/visibility.svg'
                : 'assets/icons/visibility-off.svg',
            color: textColor,
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,
          style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8.0),
        TextField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          obscureText: widget.isSecure ? !_isPasswordVisible : false,
          style: TextStyle(color: textColor),
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: widget.placeholder,
            hintStyle:
                TextStyle(color: placeholderColor, fontWeight: FontWeight.w100),
            prefixIcon: widget.prefix.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      widget.prefix,
                      color: textColor,
                    ),
                  )
                : null,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: widget.borderWidth,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: inputBgColor,
          ),
        ),
      ],
    );
  }
}
