import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:techtrain_todo_app/screen/add/add_screen.dart';

class HomeScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  void _sharedPreference() async {}

  void onTap() {
    //Get.to(() => const AddScreen());

    showCupertinoModalBottomSheet(
      context: Get.context!,
      builder: (context) => const AddScreen(),
      expand: true
    );
  }
}
