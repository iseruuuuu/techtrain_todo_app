import 'package:flutter/material.dart';
import 'package:techtrain_todo_app/component/add_picker.dart';
import 'package:techtrain_todo_app/component/add_textfield.dart';
import 'package:techtrain_todo_app/component/add_title_item.dart';

class AddItem2 extends StatelessWidget {
  const AddItem2({
    Key? key,
    required this.title,
    required this.hintText,
  }) : super(key: key);

  final String title;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddTitleItem(title: title),
       AddPicker(title: hintText),
      ],
    );
  }
}
