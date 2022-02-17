import 'package:flutter/material.dart';
import 'package:innovator/constants/colors.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/global_components/rounded_container.dart';

class IdeaWidget extends StatelessWidget {
  const IdeaWidget(
      {Key? key,
      required this.text,
      required this.opened,
      required this.onSelect,
      required this.isFavourite,
      required this.onFavourite,
      required this.editMode,
      required this.toggleSelect,
      required this.selected})
      : super(key: key);
  final String text;
  final bool selected;
  final bool opened;
  final bool isFavourite;
  final bool editMode;
  final onFavourite;
  final toggleSelect;
  final onSelect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RoundedContainer(
        onTap: onSelect,
        color: Color(0xFFF5F5F5F5),
        // height: 77,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      editMode
                          ? Row(
                              children: [
                                GestureDetector(
                                  onTap: toggleSelect,
                                  child: CircleAvatar(
                                    backgroundColor: selected
                                        ? VIOLET_COLOR
                                        : Color(0xFF8E8E8E).withOpacity(0.17),
                                    radius: 8,
                                    child: selected
                                        ? Icon(
                                            Icons.check,
                                            size: 10,
                                            color: Colors.white,
                                          )
                                        : null,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                              ],
                            )
                          : SizedBox(),
                      Text(
                        "12.03.2021",
                        style: MAIN_TEXT_STYLE_BLACK.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF8D8D8D8D),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    radius: 100,
                    customBorder: const CircleBorder(),
                    onTap: onFavourite,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 12,
                      child: Icon(
                        isFavourite ? Icons.favorite : Icons.favorite_border,
                        size: 16,
                        color: Color(0xFF8D8D8D8D),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 400),
                child: ConstrainedBox(
                    constraints: opened
                        ? BoxConstraints(maxHeight: double.infinity)
                        : BoxConstraints(maxHeight: 20),
                    child: Text(
                      text,
                      softWrap: true,
                      maxLines: opened ? 9999 : 1,
                      overflow: TextOverflow.ellipsis,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
