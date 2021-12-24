import 'package:flutter/material.dart';

class TodoButton extends StatelessWidget {
  const TodoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text(
        '作成する',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal,
          fontSize: 17,
          color: Colors.white,
        ),
      ),
    );
  }
}
