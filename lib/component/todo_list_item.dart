import 'package:flutter/material.dart';
import 'package:techtrain_todo_app/model/todo.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF75AED7),
      child: ListTile(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            //TODO オンオフをつける
            Icons.check_circle,
            //Icons.circle,
            //TODO 色を青とグレイ？にする。
            color: Color(0xFF2654CB),
          ),
        ),
        title: Text(
          '${todo.taskName}\n'
          //TODO これはグレーじゃないとダメ、、
          '${todo.detail}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            fontSize: 17,
          ),
        ),
        subtitle: Row(
          children: [
            Container(
              color: Colors.pink,
              child: Text(
                '1日前',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 30),
            Text(
              todo.day,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
