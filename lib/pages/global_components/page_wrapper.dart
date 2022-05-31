import 'package:flutter/material.dart';
import 'package:innovator/pages/global_components/page_padding.dart';

import 'custom_list_view.dart';

// ignore: must_be_immutable
class PageWrapper extends StatelessWidget {
  final List<Widget> children;
  var header;
  var fab;
  var controller;
  var color;
  bool withListView;
  bool withPagePadding;
  PageWrapper({
    required this.children,
    this.fab,
    this.color,
    this.controller,
    this.header,
    this.withListView = true,
    this.withPagePadding = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      floatingActionButton: fab,
      body: SafeArea(
        child: PagePadding(
          withPagePadding: withPagePadding,
          child: Column(
            children: [
              header ?? Container(),
              Expanded(
                child: withListView
                    ? CustomListView(
                        controller: controller,
                        children: children,
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: children,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
