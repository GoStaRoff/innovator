import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Header extends StatelessWidget {
  var leftWidget;
  var middleWidget;
  var rightWidget;
  var height;

  bool withoutBack;

  Header(
      {this.leftWidget,
      this.middleWidget,
      this.rightWidget,
      this.height,
      this.withoutBack = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 45.0,
      width: Get.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          leftWidget != null
              ? Positioned(
                  left: 0,
                  child: leftWidget,
                )
              : withoutBack
                  ? const SizedBox(
                      width: 24.0,
                    )
                  : Positioned(
                      left: 0,
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: () {
                          Get.back(closeOverlays: true);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 12.0,
                          child: SvgPicture.asset(
                              "assets/icons/arrow_left_icon.svg"),
                        ),
                      ),
                    ),
          middleWidget ?? Container(),
          rightWidget != null
              ? Positioned(
                  right: 0,
                  child: rightWidget,
                )
              : const SizedBox(
                  width: 24.0,
                ),
        ],
      ),
    );
  }
}
