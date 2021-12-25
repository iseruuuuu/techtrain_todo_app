import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techtrain_todo_app/controller/controller.dart';

class AddDatePicker extends StatelessWidget {
  const AddDatePicker({
    Key? key,
    required this.isSelected,
    required this.title,
    required this.noTitle,
    required this.hintText,
  }) : super(key: key);

  final bool isSelected;
  final String title;
  final String noTitle;
  final String hintText;

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
          color: const Color(0x292D364D),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              //TODO テキストがでない。。
              isSelected ? hintText : noTitle,
              style: TextStyle(
                color: isSelected ? Colors.black : const Color(0x292D364D),
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
