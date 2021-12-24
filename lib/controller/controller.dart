import 'package:flutter/cupertino.dart';
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
  final items = <String>['仕事', '買い物', '個人', 'その他'];
  final category = ''.obs;
  final isComplete = false.obs;
  final task = ''.obs;
  final day = ''.obs;
  final detail = ''.obs;
  Todo? todo;

  @override
  void onInit() {
    super.onInit();
    _todos.addAll(Todo.initialTodos);

    print(isComplete.value);
  }

  //todo HomeScreen

  void onCheck({required Todo todo, required int index}) {
    var isCheck = todo.isCheck;
    isCheck = !todo.isCheck;
    print(isCheck);
    // todo.isCheck = !todo.isCheck;
    final newTodo = todo.copyWith(isCheck: isCheck);
    todos.setAll(index, [newTodo]);
  }

  //todo  AddScreen

  void onTapcupertinoPicker() {
    showCupertinoModalPopup(
      context: Get.context!,
      builder: (context) {
        return Container(
          //Pickerの高さを指定。指定しない場合はフルスクリーン。
          height: 400,
          color: Colors.white,
          child: Column(
            children: [
              TextButton(
                child: const Text('閉じる'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const Divider(),
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 40,
                  children: items.map((n) => Text(n)).toList(),
                  onSelectedItemChanged: (index) {
                    category.value = items[index];
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void onTap() {
    showCupertinoModalBottomSheet(
      context: Get.context!,
      builder: (context) => AddScreen(),
      expand: true,
    );
  }

  void onTapClose() {
    Get.back();
  }

  void onChange(String word) {
    print(word);
  }

  void onTapSubmit({required Todo todo}) {
    //TODO 登録する。
    var newTodo = todo.copyWith(
      taskName: task.value,
      day: day.value,
      category: category.value,
      detail: detail.value,
    );

    print(task.value);
    print(day.value);
    print(category.value);
    print(detail.value);

    //登録できた？
    //todos.add(newTodo);
    //Get.back();
  }
}
