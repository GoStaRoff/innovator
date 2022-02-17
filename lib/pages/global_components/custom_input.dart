import 'package:flutter/material.dart';
import 'package:innovator/constants/colors.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/global_components/rounded_container.dart';

// ignore: must_be_immutable
class CustomInput extends StatelessWidget {
  var hintText;
  double height;
  double width;
  bool borderEnabled;
  bool isPassword;
  var controller;
  var color;
  var keyboardType;
  var inputFormatters;
  var onChanged;
  var initialValue;
  var style;
  var maxLength;

  CustomInput(
      {Key? key,
      this.hintText,
      this.color,
      this.height = 45,
      this.width = 200,
      this.borderEnabled = false,
      this.isPassword = false,
      this.controller,
      this.inputFormatters,
      this.keyboardType,
      this.onChanged,
      this.maxLength,
      this.initialValue,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      color: color ?? LIGHT_GREY_COLOR,
      borderEnabled: borderEnabled,
      borderRadius: 14,
      height: height,
      width: width,
      child: Padding(
        padding: maxLength == null
            ? EdgeInsets.symmetric(horizontal: 20.0)
            : EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
        child: TextFormField(
          keyboardType: keyboardType,
          maxLength: maxLength == null ? null : 200,
          inputFormatters: inputFormatters,
          obscureText: isPassword,
          maxLines: isPassword ? 1 : 10,
          style: style ?? MAIN_TEXT_STYLE_BLACK.copyWith(color: Colors.black),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: MAIN_TEXT_STYLE_BLACK.copyWith(color: Color(0xFFB9B9B9)),
            border: InputBorder.none,
          ),
          controller: controller,
          onChanged: onChanged,
          initialValue: initialValue,
        ),
      ),
    );
  }
}
