import 'package:flutter/material.dart';

class PagePadding extends StatelessWidget {
  final Widget child;
  bool withPagePadding;
  PagePadding({required this.child, this.withPagePadding = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: withPagePadding
          ? EdgeInsets.only(top: 10.0, left: 16.0, right: 16.0)
          : EdgeInsets.all(0),
      child: child,
    );
  }
}
