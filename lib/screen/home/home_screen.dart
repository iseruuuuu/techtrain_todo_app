import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techtrain_todo_app/color/app_color.dart';
import 'package:techtrain_todo_app/component/home/floating_action_button/floating_action_button.dart';
import 'package:techtrain_todo_app/component/home/todo_cell/todo_list_item.dart';
import 'package:techtrain_todo_app/controller/controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller(), tag: '');
    final todo = controller.todos;
    return Scaffold(
      backgroundColor: AppColor.appColor,
      appBar: PreferredSize(
        preferredSize: Size.zero,
        child: AppBar(
          backgroundColor: AppColor.appColor,
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 24, left: 24, top: 28),
                child: Text(
                  'TODOリスト',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 28,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    color: AppColor.black,
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    controller: ScrollController(),
                    itemCount: todo.length,
                    itemExtent: 111,
                    itemBuilder: (BuildContext context, int index) {
                      final todoItem = todo[index];
                      return TodoListItem(
                        todo: todoItem,
                        onTap: () =>
                            controller.onCheck(todo: todoItem, index: index),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButtons(
        onTap: controller.onTap,
      ),
    );
  }
}
