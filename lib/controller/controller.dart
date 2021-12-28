import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:techtrain_todo_app/component/add/picker/picker.dart';
import 'package:techtrain_todo_app/model/todo.dart';
import 'package:techtrain_todo_app/preference/storage_service.dart';
import 'package:techtrain_todo_app/screen/add/add_screen.dart';

class Controller extends GetxController {
  final todos = <Todo>[].obs;
  final storage = TodoStorage();
  late final Worker worker;

  List<Todo> get _todos => todos;
  final items = <String>['仕事', '買い物', '個人', 'その他'];
  final category = ''.obs;
  final task = ''.obs;
  final day = ''.obs;
  final detail = ''.obs;
  final deadLine = ''.obs;
  final deadLineColor = 0xFFF96983.obs;
  Todo? todo;
  final colorCode = 0xFF75AED7.obs;
  final isComplete = false.obs;
  final isDaySelected = false.obs;
  final isCategorySelected = false.obs;
  final isTaskName = false.obs;
  final isDetail = false.obs;
  final dataTime = ''.obs;

  @override
  void onInit() {
    super.onInit();
    final storageMemos =
        storage.load()?.map((json) => Todo.fromJson(json)).toList();
    final initialMemos = storageMemos ?? [];
    _todos.addAll(initialMemos);

    worker = ever<List<Todo>>(todos, (memos) {
      final data = memos.map((e) => e.toJson()).toList();
      storage.save(data);
    });
  }

  //HOMEScreen

  void onTap() {
    showCupertinoModalBottomSheet(
      context: Get.context!,
      builder: (context) => const AddScreen(),
      expand: true,
    );
  }

  void checkDeadline({required int deadline}) {
    if (deadline == 0) {
      deadLine.value = '今日まで';
      deadLineColor.value = 0xFF2654CD;
    } else {
      deadLine.value = '$deadline日前';
      deadLineColor.value = 0xFFF96983;
    }
  }

  void onCheck({required Todo todo, required int index}) async {
    var isCheck = todo.isCheck;
    isCheck = !todo.isCheck;
    final newTodo = todo.copyWith(isCheck: isCheck);
    todos.setAll(index, [newTodo]);

    await Future.delayed(const Duration(seconds: 1));
    todos.removeAt(index);
  }

  void onTapCategoryPicker() {
    showCupertinoModalPopup(
      context: Get.context!,
      builder: (context) {
        return Picker(
          children: items.map((n) => Text(n)).toList(),
          onSelectedItemChanged: onSelectedItemChanged,
        );
      },
    );
  }

  void onSelectedItemChanged(int index) {
    isCategorySelected.value = true;
    checkAllWrite();
    category.value = items[index];
    switch (category.value) {
      case '個人':
        colorCode.value == 0xFFA2A0EB;
        break;
      case '仕事':
        colorCode.value = 0xFF75AED7;
        break;
      case '買い物':
        colorCode.value = 0xFFA2A0EB;
        break;
      case 'その他':
        colorCode.value == 0xFF4F73D0;
        break;
      default:
    }
  }

  void onTapDatePicker() {
    DatePicker.showDatePicker(
      Get.context!,
      theme: const DatePickerTheme(
        containerHeight: 210.0,
      ),
      showTitleActions: true,
      minTime: DateTime.now(),
      maxTime: DateTime(2030, 1, 1),
      onConfirm: onConfirm,
      currentTime: DateTime.now(),
      locale: LocaleType.jp,
    );
  }

  void onConfirm(DateTime date) {
    var weekday = '';
    switch (date.weekday) {
      case 1:
        weekday = '(月)';
        break;
      case 2:
        weekday = '(火)';
        break;
      case 3:
        weekday = '(水)';
        break;
      case 4:
        weekday = '(木)';
        break;
      case 5:
        weekday = '(金)';
        break;
      case 6:
        weekday = '(土)';
        break;
      case 7:
        weekday = '(日)';
        break;
      default:
    }
    day.value = '${date.month}月${date.day}日$weekday';
    final Duration difference = date.difference(DateTime.now());
    if (date.day == DateTime.now().day) {
      checkDeadline(deadline: 0);
    } else {
      checkDeadline(deadline: difference.inDays + 1);
    }
    dataTime.value = '${date.year}/${date.month}/${date.day}';
    isDaySelected.value = true;
    checkAllWrite();
  }

  void onTapClose() {
    Get.back();
    isComplete.value = false;
    isTaskName.value = false;
    isDetail.value = false;
    isCategorySelected.value = false;
    isDaySelected.value = false;
  }

  void onChange({required String text, required int index}) {
    switch (index) {
      case 1:
        task.value = text;
        isTaskName.value = true;
        checkAllWrite();
        break;
      case 2:
        detail.value = text;
        isDetail.value = true;
        checkAllWrite();
        break;
      default:
    }
  }

  void onTapSubmit() {
    final todo = Todo(
      taskName: task.value,
      day: day.value,
      category: category.value,
      detail: detail.value,
      color: colorCode.value,
      isCheck: false,
      deadline: deadLine.value,
      deadlineColor: deadLineColor.value,
    );
    todos.add(todo);
    allClear();
    Get.back();
  }

  void checkAllWrite() {
    if (isDaySelected.value == true &&
        isCategorySelected.value == true &&
        isTaskName.value == true &&
        isDetail.value == true) {
      isComplete.value = true;
    } else {}
  }

  void allClear() {
    //入力内容を空にする。
    task.value = '';
    category.value = '';
    detail.value = '';
    day.value = '';
    deadLine.value = '';

    //記入確認を元に戻す.
    isTaskName.value = false;
    isDaySelected.value = false;
    isCategorySelected.value = false;
    isDetail.value = false;
  }
}
