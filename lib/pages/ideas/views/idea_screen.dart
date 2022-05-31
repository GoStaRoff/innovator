import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/colors.dart';
import 'package:innovator/constants/functions.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/global_components/header.dart';
import 'package:innovator/pages/global_components/page_wrapper.dart';
import 'package:innovator/pages/ideas/components/idea_widget.dart';
import 'package:innovator/pages/ideas/controllers/idea_controller.dart';
import 'package:innovator/pages/ideas/views/advice_dialog.dart';
import 'package:innovator/pages/ideas/views/generator_dialog.dart';
import 'package:innovator/pages/ideas/views/new_idea_dialog.dart';

class IdeaScreen extends StatefulWidget {
  const IdeaScreen({Key? key}) : super(key: key);

  @override
  State<IdeaScreen> createState() => _IdeaScreenState();
}

class _IdeaScreenState extends State<IdeaScreen>
    with TickerProviderStateMixin<IdeaScreen> {
  IdeaController ideaController = Get.put(IdeaController());
  final ScrollController _scrollController = ScrollController();
  bool showButtons = true;
  void _scrollListener() {
    print("listen");
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (showButtons) {
        setState(() {
          showButtons = false;
        });
      }
    }
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!showButtons) {
        setState(() {
          showButtons = true;
        });
      }
    }
  }

  @override
  void initState() {
    print("idead");
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PageWrapper(
        header: Header(
          leftWidget: !ideaController.editMode.value
              ? Text(
                  "Мои идеи",
                  style: TITLE_TEXT_STYLE_BLACK.copyWith(fontSize: 20),
                )
              : Text(
                  "Выбрано: ${ideaController.selectedCount.value}",
                  style: TITLE_TEXT_STYLE_BLACK.copyWith(fontSize: 20),
                ),
          rightWidget: ideaController.editMode.value
              ? Row(
                  children: [
                    InkWell(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        onTap: ideaController.selectAll,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                          child: Text(
                            "Выбрать все",
                            style: MAIN_TEXT_STYLE_BLACK,
                          ),
                        )),
                    const SizedBox(
                      width: 18,
                    ),
                    InkWell(
                      onTap: ideaController.deleteSelected,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      child: SvgPicture.asset("assets/icons/trash_icon.svg"),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    InkWell(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      onTap: ideaController.disposeEditMode,
                      child: SvgPicture.asset("assets/icons/close_icon.svg"),
                    ),
                  ],
                )
              : Row(
                  children: [
                    InkWell(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        onTap: () {
                          ideaController.editMode.value = true;
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                          child: Text(
                            "Выбрать",
                            style: MAIN_TEXT_STYLE_BLACK,
                          ),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        AppDialog(AdviceDialog());
                      },
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: GREY_COLOR,
                        child: Text(
                          "?",
                          style: MAIN_TEXT_STYLE_BLACK,
                        ),
                      ),
                    )
                  ],
                ),
        ),
        children: [
          Stack(
            children: [
              SizedBox(
                height: Get.height - 150,
                width: Get.width,
                child: ReorderableListView(
                  physics: BouncingScrollPhysics(),
                  scrollController: _scrollController,
                  children: <Widget>[
                    for (int index = 0;
                        index < ideaController.ideas.length;
                        index++)
                      SizedBox(
                        key: ValueKey(ideaController.ideas[index]),
                        child: IdeaWidget(
                          selected: (ideaController.ideas[index]["isChecked"]
                                  as RxBool)
                              .value,
                          toggleSelect: () {
                            ideaController.toggleSelect(index);
                          },
                          editMode: ideaController.editMode.value,
                          text: ideaController.ideas[index]["text"] as String,
                          opened: index == ideaController.openedIdeaIndex.value,
                          onSelect: () {
                            ideaController.changeSelectedIdeaIndex(index);
                          },
                          onFavourite: () {
                            ideaController.toggleFavourite(index);
                          },
                          isFavourite: (ideaController.ideas[index]
                                  ["isFavourite"] as RxBool)
                              .value,
                        ),
                      )
                  ],
                  onReorder: ideaController.reorderData,
                ),
              ),
              Positioned(
                  bottom: 74,
                  right: 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: ideaController.ideas.isEmpty,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Bubble(
                              padding: const BubbleEdges.symmetric(
                                  horizontal: 16, vertical: 24),
                              alignment: Alignment.center,
                              nip: BubbleNip.no,
                              color: const Color(0xFFF5F5F5),
                              child: Text('Придумывай и записывай свои идеи',
                                  textAlign: TextAlign.center,
                                  style: MAIN_TEXT_STYLE_BLACK),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SvgPicture.asset("assets/icons/nip_icon.svg"),
                                const SizedBox(
                                  width: 60,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                      ),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: showButtons ? 50 : 0,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                AppDialog(NewIdeaDialog());
                              },
                              child: const CircleAvatar(
                                radius: 28,
                                backgroundColor: VIOLET_COLOR,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            GestureDetector(
                              onTap: () {
                                AppDialog(GeneratorDialog());
                              },
                              child: CircleAvatar(
                                radius: 28,
                                backgroundColor: GREEN_COLOR,
                                child: SvgPicture.asset(
                                    "assets/icons/bell_icon.svg"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          // ...List.generate(
          //   ideaController.ideas.length,
          //   (index) =>
          // ),
        ],
      ),
    );
  }
}
