import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techtrain_todo_app/component/add_button.dart';
import 'package:techtrain_todo_app/component/add_item.dart';
import 'package:techtrain_todo_app/component/add_item2.dart';
import 'package:techtrain_todo_app/controller/controller.dart';
import 'package:techtrain_todo_app/model/todo.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller(), tag: '');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          '新規作成',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            fontStyle: FontStyle.normal,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: controller.onTapClose,
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AddItem(
            title: 'タスク名',
            hintText: '20文字以内で入力してください',
            onChange: (text) => controller.onChange(text),
          ),
          AddItem(
            title: '期日',
            hintText: '年/月/日',
            onChange: (text) => controller.onChange(text),
          ),
          AddItem2(
            title: 'カテゴリー',
            hintText: '選択してください      ↓',
          ),
          AddItem(
            title: '詳細',
            hintText: '入力してください',
            onChange: (text) => controller.onChange(text),
          ),
          Center(
            child: AddButton(
              // onTap: () => controller.isComplete.value
              //     ? controller.onTapSubmit(todo: controller.todo)
              //     : null,
              //onTap: () => controller.onTapSubmit(todo: controller.todo),
              onTap: () => controller.onTapSubmit(todo: controller.todo!),
            ),
          ),
        ],
      ),
    );
  }
}