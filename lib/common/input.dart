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
    this.borderColor = Colors.black,
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
  final Color borderColor;
  final double borderWidth;

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  late FocusNode _focusNode;

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
    final Color inputBgColor = Theme.of(context).brightness == Brightness.dark
        ? MainColors.darkBoxColor
        : MainColors.boxColor;
    final Color placeholderColor =
        Theme.of(context).brightness == Brightness.dark
            ? MainColors.pDarkText
            : MainColors.pText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.name),
        const SizedBox(height: 8.0),
        TextField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          obscureText: widget.isSecure,
          style: TextStyle(color: Theme.of(context).textTheme.bodySmall!.color),
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: widget.placeholder,
            hintStyle: TextStyle(color: placeholderColor),
            prefixIcon: widget.prefix.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(widget.prefix),
                  )
                : null,
            suffixIcon: widget.suffix.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(widget.suffix),
                  )
                : null,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: _focusNode.hasFocus
                    ? Theme.of(context).primaryColor
                    : inputBgColor,
                width: widget.borderWidth,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            filled: true,
            fillColor: inputBgColor,
          ),
        ),
      ],
    );
  }
}
