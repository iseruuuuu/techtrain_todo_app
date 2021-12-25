import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techtrain_todo_app/controller/controller.dart';

class AddPicker extends StatelessWidget {
  const AddPicker({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.noTitle,
  }) : super(key: key);

  final String title;
  final bool isSelected;
  final String noTitle;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller(), tag: '');
    return GestureDetector(
      onTap: controller.onTapCategoryPicker,
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
              isSelected ? title : noTitle,
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
