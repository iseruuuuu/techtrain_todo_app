import 'package:flutter/material.dart';
import 'package:techtrain_todo_app/component/add/category/add_picker.dart';
import 'package:techtrain_todo_app/component/add/textfield/add_title_item.dart';

class AddCategoryItem extends StatelessWidget {
  const AddCategoryItem({
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
        AddPicker(
          title: title,
          noTitle: noTitle,
          isCategorySelected: isSelected,
        ),
      ],
    );
  }
}
