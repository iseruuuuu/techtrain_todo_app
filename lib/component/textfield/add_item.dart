import 'package:flutter/material.dart';
import 'package:techtrain_todo_app/component/textfield/add_textfield.dart';
import 'package:techtrain_todo_app/component/textfield/add_title_item.dart';

class AddItem extends StatelessWidget {
  const AddItem({
    Key? key,
    required this.title,
    required this.hintText,
    required this.onChange,
  }) : super(key: key);

  final String title;
  final String hintText;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddTitleItem(title: title),
        AddTextField(
          text: hintText,
          onChange: onChange,
        ),
      ],
    );
  }
}
