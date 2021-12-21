import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/colors.dart';
import 'package:innovator/pages/global_components/custom_list_view.dart';
import 'package:innovator/pages/global_components/rounded_container.dart';

class DraggableContainer extends StatefulWidget {
  double height = 0.0;
  final List<Widget> children;
  DraggableContainer({Key? key, required height, required this.children})
      : super(key: key) {
    if (height < 50) {
      this.height = 0;
    } else {
      this.height = height - 50;
    }
  }

  @override
  _DraggableContainerState createState() => _DraggableContainerState();
}

class _DraggableContainerState extends State<DraggableContainer> {
  double newContainerHeight = 200;
  double previousContainerHeight = 200;
  bool fullHeight = false;

  @override
  void initState() {
    newContainerHeight = widget.height;
    previousContainerHeight = widget.height;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        GestureDetector(
          onVerticalDragUpdate: (details) {
            if ((newContainerHeight >= 0 && details.primaryDelta! >= 0) ||
                (newContainerHeight <= widget.height &&
                    details.primaryDelta! <= 0)) {
              previousContainerHeight = newContainerHeight;
              setState(() {
                newContainerHeight -= details.primaryDelta!;
              });
              if (newContainerHeight <= previousContainerHeight) {
                setState(() {
                  fullHeight = false;
                });
              } else {
                setState(() {
                  fullHeight = true;
                });
              }
            }
          },
          onVerticalDragEnd: (details) {
            if (fullHeight || newContainerHeight >= widget.height / 1.5) {
              setState(() {
                newContainerHeight = widget.height;
              });
            } else {
              Get.back();
            }
          },
          child: RoundedContainer(
            width: Get.width,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              height: newContainerHeight + 50,
              curve: Curves.fastLinearToSlowEaseIn,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                      width: Get.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundedContainer(
                            height: 5,
                            width: 44,
                            color: GREY_COLOR,
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: CustomListView(
                        children: widget.children,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
