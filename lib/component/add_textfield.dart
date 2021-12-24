import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    final controller = Get.put(Controller(), tag: '');
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        height: 60,
        color: const Color(0x292D364D),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextField(
            onChanged: onChange,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: text,
              hintStyle: const TextStyle(
                color: Color(0x292D364D),
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
