import 'package:flutter/material.dart';
import 'package:techtrain_todo_app/color/app_color.dart';

class FloatingActionButtons extends StatelessWidget {
  const FloatingActionButtons({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 64,
      child: FloatingActionButton(
        backgroundColor: AppColor.buttonColor,
        onPressed: onTap,
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
