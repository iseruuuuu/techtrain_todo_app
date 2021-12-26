import 'package:flutter/material.dart';
import 'package:techtrain_todo_app/color/app_color.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
    required this.onTap,
    required this.isComplete,
  }) : super(key: key);

  final Function() onTap;
  final bool isComplete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: AppColor.buttonColor,
            onPrimary: AppColor.buttonColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: isComplete ? () => onTap() : null,
          child: const Text(
            '作成する',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 17,
              color: AppColor.white,
            ),
          ),
        ),
      ),
    );
  }
}
