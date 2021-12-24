import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techtrain_todo_app/component/add_button.dart';
import 'package:techtrain_todo_app/component/add_item.dart';
import 'package:techtrain_todo_app/controller/controller.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller(), tag: '');
    final deviceSize = MediaQuery.of(context).size;
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
        children: const [
          AddItem(
            title: 'タスク名',
            hintText: '20文字いないで入力してください',
          ),
          AddItem(
            title: '期日',
            hintText: '年/月/日',
          ),
          AddItem(
            title: 'カテゴリー',
            hintText: 'カテゴリー',
          ),
          AddItem(
            title: '詳細',
            hintText: '入力してください',
          ),
          Center(child: AddButton()),
        ],
      ),
    );
  }
}
