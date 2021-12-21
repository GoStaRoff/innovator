import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> AppDialog(Widget widget) async =>
    Get.dialog(widget, barrierColor: const Color(0xFF080416).withOpacity(0.7));
