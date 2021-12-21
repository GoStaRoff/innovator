import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/global_components/rounded_container.dart';

class AuthButton extends StatelessWidget {
  final String iconAsset;
  final String text;
  final onTap;
  const AuthButton({
    Key? key,
    required this.iconAsset,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      onTap: onTap,
      width: Get.width / 1.4,
      height: 56,
      borderRadius: 5,
      borderEnabled: true,
      child: Row(
        children: [
          const SizedBox(
            width: 15,
          ),
          SvgPicture.asset(iconAsset),
          const SizedBox(
            width: 15,
          ),
          Text(
            text,
            style: TITLE_TEXT_STYLE_BLACK.copyWith(
                fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
