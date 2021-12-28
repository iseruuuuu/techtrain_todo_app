import 'package:flutter/material.dart';
import 'package:techtrain_todo_app/component/add/day/add_datepicker.dart';
import 'package:techtrain_todo_app/component/add/textfield/add_title_item.dart';

class AddDayItem extends StatelessWidget {
  const AddDayItem({
    Key? key,
    required this.name,
    required this.noTitle,
    required this.isSelected,
    required this.title,
  }) : super(key: key);

  final String name;
  final String noTitle;
  final bool isSelected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddTitleItem(
          title: name,
        ),
        AddDatePicker(
          isDaySelected: isSelected,
          title: name,
          noTitle: noTitle,
          hintText: title,
        ),
      ],
    );
  }
}
