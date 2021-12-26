import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techtrain_todo_app/color/app_color.dart';

class Picker extends StatelessWidget {
  const Picker({
    Key? key,
    required this.onSelectedItemChanged,
    required this.children,
  }) : super(key: key);

  final Function(int) onSelectedItemChanged;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: AppColor.white,
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 10),
              TextButton(
                child: const Text(
                  'キャンセル',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const Spacer(),
              TextButton(
                child: const Text(
                  '完了',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const Divider(),
          Expanded(
            child: CupertinoPicker(
              itemExtent: 40,
              children: children,
              onSelectedItemChanged: onSelectedItemChanged,
            ),
          ),
        ],
      ),
    );
  }
}
