import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:techtrain_todo_app/model/todo.dart';
import 'package:techtrain_todo_app/preference/storage_service.dart';
import 'package:techtrain_todo_app/screen/add/add_screen.dart';
import 'package:techtrain_todo_app/screen/add/add_screen_ful.dart';

class Controller extends GetxController {
  final todos = <Todo>[].obs;

  final storage = TodoStorage();
  late final Worker worker;

  List<Todo> get _todos => todos;
  final items = <String>['仕事', '買い物', '個人', 'その他'];
  final category = ''.obs;
  final isComplete = false.obs;
  final task = ''.obs;
  final day = ''.obs;
  final detail = ''.obs;
  Todo? todo;
  final isDaySelected = false.obs;
  final isCategorySelected = false.obs;

  //final selectedColor = Colors.blue.obs;
  final colorCode = 0xFF75AED7.obs;

  @override
  void onInit() {
    super.onInit();
    final storageMemos =
        storage.load()?.map((json) => Todo.fromJson(json)).toList();
    final initialMemos = storageMemos ?? Todo.initialTodos;
    todos.addAll(initialMemos);

    // _todosに変化がある度にストレージに保存
    worker = ever<List<Todo>>(todos, (memos) {
      final data = memos.map((e) => e.toJson()).toList();
      storage.save(data);
    });
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
                    isCategorySelected.value = true;
                    category.value = items[index];
                    switch (category.value) {
                      case '個人':
                        // selectedColor.value == Colors.purple;
                        colorCode.value == 0xFFA2A0EB;
                        break;
                      case '仕事':
                        //selectedColor.value == Colors.lightBlueAccent;
                        colorCode.value = 0xFF75AED7;
                        break;
                      case '買い物':
                        //selectedColor.value == Colors.green;
                        colorCode.value = 0xFFA2A0EB;
                        break;
                      case 'その他':
                        //selectedColor.value == Colors.blue;
                        colorCode.value == 0xFF4F73D0;
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

  void onTapDatePicker() {
    DatePicker.showDatePicker(Get.context!,
        theme: const DatePickerTheme(
          containerHeight: 210.0,
        ),
        showTitleActions: true,
        minTime: DateTime(1900, 1, 1),
        maxTime: DateTime(2100, 1, 1), onConfirm: (date) {
      var weekday = '';
      switch (date.weekday) {
        case 1:
          //月曜日
          weekday = '(月)';
          break;
        case 2:
          //火曜日
          weekday = '(火)';
          break;
        case 3:
          //水曜日
          weekday = '(水)';
          break;
        case 4:
          //木曜日
          weekday = '(木)';
          break;
        case 5:
          //金曜日
          weekday = '(金)';
          break;
        case 6:
          //土曜日
          weekday = '(土)';
          break;
        case 7:
          //日曜日
          weekday = '(日)';
          break;
        default:
      }
      day.value = '${date.month}月${date.day}日$weekday';
      isDaySelected.value = true;
    }, currentTime: DateTime.now(), locale: LocaleType.jp);
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
      color: colorCode.value,
      isCheck: false,
    );
    todos.add(todo);
    Get.back();
  }
}
