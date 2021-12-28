import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techtrain_todo_app/color/app_color.dart';
import 'package:techtrain_todo_app/component/add/category/add_category_item.dart';
import 'package:techtrain_todo_app/component/add/day/add_day_item.dart';
import 'package:techtrain_todo_app/component/add/textfield/add_item.dart';
import 'package:techtrain_todo_app/component/home/add_button.dart';
import 'package:techtrain_todo_app/controller/controller.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller(), tag: '');
    return Scaffold(
      backgroundColor: AppColor.appColor,
      appBar: AppBar(
        backgroundColor: AppColor.appColor,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: const Text(
          '新規作成',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            fontStyle: FontStyle.normal,
            color: AppColor.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: controller.onTapClose,
            icon: const Icon(
              Icons.close,
              color: AppColor.buttonColor,
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
              noTitle: '20文字以内で入力してください',
              onChange: (text) => controller.onChange(text: text, index: 1),
            ),
            Obx(
              () => AddDayItem(
                name: '期日',
                noTitle: '年/月/日',
                title: controller.dataTime.value,
                isSelected: controller.isDaySelected.value,
              ),
            ),
            Obx(
              () => AddCategoryItem(
                name: 'カテゴリー',
                noTitle: '選択して下さい',
                title: controller.category.value,
                isSelected: controller.isCategorySelected.value,
              ),
            ),
            AddItem(
              title: '詳細',
              noTitle: '入力してください',
              onChange: (text) => controller.onChange(text: text, index: 2),
            ),
            Obx(
              () => Center(
                child: AddButton(
                  onTap: controller.onTapSubmit,
                  isComplete: controller.isComplete.value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
