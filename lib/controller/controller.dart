import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:techtrain_todo_app/model/todo.dart';
import 'package:techtrain_todo_app/screen/add/add_screen.dart';

class Controller extends GetxController {

  final todos = <Todo>[].obs;
  //final storage = TodoStorage();
  late final Worker worker;
  List<Todo> get _todos => todos;

  @override
  void onInit() {
    super.onInit();
    _todos.addAll(Todo.initialTodos);
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

  void onTapClose() {
    Get.back();
  }
}
