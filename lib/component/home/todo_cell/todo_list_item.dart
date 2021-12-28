import 'package:flutter/material.dart';
import 'package:techtrain_todo_app/color/app_color.dart';
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
          color: Color(todo.color),
        ),
        child: ListTile(
          minVerticalPadding: 6,
          leading: IconButton(
            onPressed: onTap,
            icon: Icon(
              todo.isCheck ? Icons.check_circle : Icons.circle,
              color: todo.isCheck
                  ? AppColor.buttonColor
                  : const Color.fromARGB(16, 38, 84, 203),
            ),
          ),
          title: Text(
            todo.taskName,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColor.white,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              fontSize: 17,
            ),
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                todo.detail,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white60,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  fontSize: 17,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 64,
                    height: 22,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      color: Color(todo.deadlineColor),
                    ),
                    child: Center(
                      child: Text(
                        todo.deadline,
                        style: const TextStyle(
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    todo.day,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
