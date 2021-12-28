import 'package:flutter/material.dart';
import 'package:techtrain_todo_app/color/app_color.dart';

class AddTitleItem extends StatelessWidget {
  const AddTitleItem({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28),
      child: Text(
        name,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 17,
          color: Colors.black45,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
