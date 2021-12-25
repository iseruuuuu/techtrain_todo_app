import 'package:flutter/material.dart';
import 'package:techtrain_todo_app/component/add_picker.dart';
import 'package:techtrain_todo_app/component/add_textfield.dart';
import 'package:techtrain_todo_app/component/add_title_item.dart';

class AddItem2 extends StatelessWidget {
  const AddItem2({
    Key? key,
    required this.title,
    required this.hintText,
    required this.noText,
    required this.isSelected,
  }) : super(key: key);

  final String title;
  final String hintText;
  final String noText;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddTitleItem(
          title: title,
        ),
        AddPicker(
          title: hintText,
          noTitle: noText,
          isSelected: isSelected,
        ),
      ],
    );
  }
}
