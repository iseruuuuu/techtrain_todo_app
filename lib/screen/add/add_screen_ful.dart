import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techtrain_todo_app/component/day/add_day_item.dart';
import 'package:techtrain_todo_app/controller/controller.dart';
import '../../component/add_button.dart';
import '../../component/textfield/add_item.dart';
import '../../component/category/add_category_item.dart';

class AddScreenFul extends StatefulWidget {
  const AddScreenFul({Key? key}) : super(key: key);

  @override
  _AddScreenFulState createState() => _AddScreenFulState();
}

//TODO 期日設定がまだできていない。
//TODO ちょっとした修正（formなど）
//TODO 上にスワイプした時にisCompleteの状態を戻したい


class _AddScreenFulState extends State<AddScreenFul> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller(), tag: '');
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: const Text(
          '新規作成',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            fontStyle: FontStyle.normal,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: controller.onTapClose,
            icon: const Icon(
              Icons.close,
              color: Colors.blue,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 40,
            ),
            AddItem(
              title: 'タスク名',
              hintText: '20文字以内で入力してください',
              onChange: (text) => controller.onChange(word: text, index: 1),
            ),
            Obx(
              () => AddDayItem(
                title: '期日',
                noTitle: '年/月/日',
                hintText: controller.day.value,
                isSelected: controller.isDaySelected.value,
              ),
            ),
            Obx(
              () => AddCategoryItem(
                title: 'カテゴリー',
                noText: '選択して下さい',
                hintText: controller.category.value,
                isSelected: controller.isCategorySelected.value,
              ),
            ),
            AddItem(
              title: '詳細',
              hintText: '入力してください',
              onChange: (text) => controller.onChange(word: text, index: 2),
            ),

            //TODO ここも状態管理をしたい
            Obx(
              () => Center(
                child: AddButton(
                  onTap: controller.onTapSubmit,
                  isComplete: controller.isComplete.value,
                  //onTap: controller.onTapSubmit,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
