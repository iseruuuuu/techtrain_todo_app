import 'package:flutter/material.dart';
import 'package:techtrain_todo_app/component/add/textfield/add_textfield.dart';
import 'package:techtrain_todo_app/component/add/textfield/add_title_item.dart';

class AddItem extends StatelessWidget {
  const AddItem({
    Key? key,
    required this.title,
    required this.noTitle,
    required this.onChange,
  }) : super(key: key);

  final String title;
  final String noTitle;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddTitleItem(title: title),
        AddTextField(
          text: noTitle,
          onChange: onChange,
        ),
      ],
    );
  }
}
