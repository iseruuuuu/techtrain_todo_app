import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techtrain_todo_app/controller/controller.dart';

class AddPicker extends StatelessWidget {
  const AddPicker({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller(), tag: '');
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        height: 60,
        color: const Color(0x292D364D),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: TextButton(
            child: Text(
              //TODO テキストがでない。。
              title,
              style: const TextStyle(
                //color: Color(0x292D364D),
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
            onPressed: controller.onTapcupertinoPicker,
          ),
        ),
      ),
    );
  }
}
