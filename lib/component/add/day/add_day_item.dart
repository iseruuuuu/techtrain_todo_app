import 'package:flutter/material.dart';
import 'package:techtrain_todo_app/component/add/day/add_datepicker.dart';
import 'package:techtrain_todo_app/component/add/textfield/add_title_item.dart';

class AddDayItem extends StatelessWidget {
  const AddDayItem({
    Key? key,
    required this.title,
    required this.noTitle,
    required this.isSelected,
    required this.hintText,
  }) : super(key: key);

  final String title;
  final String noTitle;
  final bool isSelected;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddTitleItem(
          title: title,
        ),
        AddDatePicker(
          isDaySelected: isSelected,
          title: title,
          noTitle: noTitle,
          hintText: hintText,
        ),
      ],
    );
  }
}
