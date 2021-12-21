import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:innovator/constants/colors.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/global_components/rounded_container.dart';

class AppButton extends StatefulWidget {
  double height;
  double width;
  var onTap;
  final String text;
  Color color;
  TextStyle style;
  bool borderEnabled;

  AppButton({
    Key? key,
    required this.text,
    this.height = 56.0,
    this.onTap,
    this.borderEnabled = false,
    this.style = MAIN_TEXT_STYLE_WHITE,
    this.width = 160.0,
    this.color = VIOLET_COLOR,
  }) : super(key: key);

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  double _opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacity,
      child: GestureDetector(
        onTap: () async {
          setState(() {
            _opacity = 0.3;
          });
          await widget.onTap();
          setState(() {
            _opacity = 1;
          });
        },
        child: RoundedContainer(
          height: widget.height,
          width: widget.width,
          borderEnabled: widget.borderEnabled,
          borderRadius: 36,
          color: widget.color,
          child: Center(
            child: AutoSizeText(
              widget.text,
              style: widget.style,
            ),
          ),
        ),
      ),
    );
  }
}
