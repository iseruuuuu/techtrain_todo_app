import 'package:flutter/material.dart';

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
          //TODO　この調整がまじでわからん。
          onPressed: null,
          //onPressed: onTap,
          // onPressed: () =>
          //   (isComplete)
          //       ? null
          //       : null
          // ,
          child: const Text(
            '作成する',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
