import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:techtrain_todo_app/model/todo.dart';
import 'package:techtrain_todo_app/screen/add/add_screen.dart';
import 'package:techtrain_todo_app/screen/add/add_screen_ful.dart';

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
  final isSelected = false.obs;
  final selectedColor = Colors.blue.obs;

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
                    isSelected.value = true;
                    category.value = items[index];
                    switch (category.value) {
                      case '個人':
                        selectedColor.value == Colors.purple;
                        break;
                      case '仕事':
                        selectedColor.value == Colors.lightBlueAccent;
                        break;
                      case '買い物':
                        selectedColor.value == Colors.green;
                        break;
                      case 'その他':
                        selectedColor.value == Colors.blue;
                        break;
                      default:
                    }
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
      //builder: (context) => AddScreen(),
      builder: (context) => AddScreenFul(),
      expand: true,
    );
  }

  void onTapClose() {
    Get.back();
  }

  void onChange({required String word, required int index}) {
    switch (index) {
      case 1:
        task.value = word;
        break;
      case 2:
        day.value = word;
        break;
      case 3:
        detail.value = word;
        break;
      default:
    }
  }

  void onTapSubmit() {
    //とりあえず、登録はできた。
    final todo = Todo(
      taskName: task.value,
      day: day.value,
      category: category.value,
      detail: detail.value,
      color: selectedColor.value,
      isCheck: false,
    );
    todos.add(todo);
    Get.back();
  }
}
