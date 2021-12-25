import 'package:flutter/material.dart';
import 'package:techtrain_todo_app/model/todo.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    Key? key,
    required this.todo,
    required this.onTap,
  }) : super(key: key);

  final Todo todo;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: todo.color,
        ),
        child: ListTile(
          leading: IconButton(
            onPressed: onTap,
            icon: Icon(
              todo.isCheck ? Icons.check_circle : Icons.circle,
              color: todo.isCheck
                  ? const Color(0xFF2654CB)
                  : const Color.fromARGB(16, 38, 84, 203),
            ),
          ),
          title: Text(
            '${todo.taskName}\n'
            //TODO これはグレーじゃないとダメ、、
            '${todo.detail}',
            overflow: TextOverflow.ellipsis,
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
                width: 64,
                height: 22,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  color: Colors.pink,
                ),
                child: Center(
                  child: Text(
                    //TODO X日前に設定する必要がある。
                    '1日前',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
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
      ),
    );
  }
}
