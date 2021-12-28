import 'package:flutter/material.dart';
import 'package:techtrain_todo_app/component/add/day/add_datepicker.dart';
import 'package:techtrain_todo_app/component/add/textfield/add_title_item.dart';

class AddDayItem extends StatelessWidget {
  const AddDayItem({
    Key? key,
    required this.name,
    required this.title,
    required this.noTitle,
    required this.isSelected,
  }) : super(key: key);

  final String name;
  final String title;
  final String noTitle;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AddTitleItem(
          name: name,
        ),
        AddDatePicker(
          isDaySelected: isSelected,
          name: name,
          noTitle: noTitle,
          title: title,
        ),
      ],
    );
  }
}
