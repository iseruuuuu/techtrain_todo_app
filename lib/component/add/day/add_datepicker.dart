import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techtrain_todo_app/color/app_color.dart';
import 'package:techtrain_todo_app/controller/controller.dart';

class AddDatePicker extends StatelessWidget {
  const AddDatePicker({
    Key? key,
    required this.isDaySelected,
    required this.name,
    required this.noTitle,
    required this.title,
  }) : super(key: key);

  final bool isDaySelected;
  final String name;
  final String noTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller(), tag: '');
    return GestureDetector(
      onTap: controller.onTapDatePicker,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: AppColor.grey10,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              isDaySelected ? title : noTitle,
              style: TextStyle(
                color: isDaySelected ? AppColor.black : Colors.black26,
                fontSize: 17,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
