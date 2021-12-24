import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techtrain_todo_app/component/todo_list_item.dart';
import 'package:techtrain_todo_app/controller/controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller(), tag: '');
    final deviceSize = MediaQuery.of(context).size;
    final todo = controller.todos;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 24, left: 24, top: 76),
                child: Text(
                  'TODOリスト',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 28,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  controller: ScrollController(),
                  itemCount: todo.length,
                  itemExtent: 90,
                  itemBuilder: (BuildContext context, int index) {
                    final todoItem = todo[index];
                    return TodoListItem(
                      todo: todoItem,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF2654CB),
        onPressed: controller.onTap,
        child: const Icon(Icons.add),
      ),
    );
  }
}
