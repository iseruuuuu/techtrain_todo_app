import 'package:flutter/material.dart';

class AddTitleItem extends StatelessWidget {
  const AddTitleItem({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 17,
          color: Color(0x292d3680),
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
