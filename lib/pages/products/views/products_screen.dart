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
import 'package:innovator/pages/products/components/product_widget.dart';
import 'package:innovator/pages/products/controllers/products_controller.dart';
import 'package:innovator/pages/products/views/advice_dialog.dart';
import 'package:innovator/pages/products/views/choose_product_dialog.dart';
import 'package:reorderables/reorderables.dart';

class ProductsScreen extends StatelessWidget {
  ProductsController productsController = Get.put(ProductsController());
  bool showButtons = true;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PageWrapper(
        header: Header(
          leftWidget: !productsController.editMode.value
              ? Text(
                  "Мои продукты",
                  style: TITLE_TEXT_STYLE_BLACK.copyWith(fontSize: 20),
                )
              : Text(
                  "Выбрано: ${productsController.selectedCount.value}",
                  style: TITLE_TEXT_STYLE_BLACK.copyWith(fontSize: 20),
                ),
          rightWidget: productsController.editMode.value
              ? Row(
                  children: [
                    InkWell(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        onTap: productsController.selectAll,
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
                      onTap: productsController.deleteSelected,
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
                      onTap: productsController.disposeEditMode,
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
                          productsController.editMode.value = true;
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
                child: Obx(
                  () => ReorderableWrap(
                      spacing: 4.0,
                      scrollPhysics: BouncingScrollPhysics(),
                      runSpacing: 4.0,
                      padding: const EdgeInsets.all(8),
                      children: List.generate(
                          productsController.products.length,
                          (index) => ProductWidget(
                                text: productsController.products[index]
                                    ["name"],
                                editMode: productsController.editMode.value,
                                toggleSelect: () {
                                  productsController.toggleSelect(index);
                                },
                                selected: (productsController.products[index]
                                        ["isChecked"] as RxBool)
                                    .value,
                              )),
                      onReorder: productsController.reorderData,
                      onNoReorder: (int index) {
                        //this callback is optional
                        debugPrint(
                            '${DateTime.now().toString().substring(5, 22)} reorder cancelled. index:$index');
                      },
                      onReorderStarted: (int index) {
                        //this callback is optional
                        debugPrint(
                            '${DateTime.now().toString().substring(5, 22)} reorder started: index:$index');
                      }),
                ),
              ),
              Positioned(
                  bottom: 24,
                  right: 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Visibility(
                        visible: productsController.products.isEmpty,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Bubble(
                              padding: const BubbleEdges.symmetric(
                                  horizontal: 16, vertical: 24),
                              alignment: Alignment.center,
                              nip: BubbleNip.no,
                              color: const Color(0xFFF5F5F5),
                              child: Text(
                                  'Создай свой первый продукт\nили технологию',
                                  textAlign: TextAlign.center,
                                  style: MAIN_TEXT_STYLE_BLACK),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SvgPicture.asset("assets/icons/nip_icon.svg"),
                                const SizedBox(
                                  width: 25,
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
                                AppDialog(ChooseProductDialog());
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
          //   productsController.products.length,
          //   (index) =>
          // ),
        ],
      ),
    );
  }
}
