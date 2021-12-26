import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techtrain_todo_app/color/app_color.dart';
import 'package:techtrain_todo_app/controller/controller.dart';

class AddTextField extends StatelessWidget {
  const AddTextField({
    Key? key,
    required this.text,
    required this.onChange,
  }) : super(key: key);

  final String text;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: AppColor.grey10,
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10, top: 5),
          child: TextField(
            onChanged: onChange,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: text,
              hintStyle: const TextStyle(
                color: Colors.black26,
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
