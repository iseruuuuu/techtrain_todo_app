import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class Todo {
  final String id;
  final String taskName;
  final String category;
  final String detail;
  final String day;
  final bool isCheck;
  final Color color;

  Todo({
    required this.taskName,
    required this.category,
    required this.detail,
    required this.day,
    required this.isCheck,
    required this.color,
  }) : id = DateTime.now().millisecondsSinceEpoch.toString();

  const Todo.withId({
    required this.id,
    required this.taskName,
    required this.category,
    required this.detail,
    required this.day,
    required this.isCheck,
    required this.color,
  });

  static const initialTodos = [
    Todo.withId(
      id: '0',
      taskName: '個人は紫',
      category: '個人',
      detail: '説明',
      day: '12/24(水)',
      isCheck: false,
      color: Colors.purple,
    ),
    Todo.withId(
      id: 'ああああ',
      taskName: '仕事は水色',
      category: '仕事',
      detail: '説明',
      day: '12/24(水)',
      isCheck: false,
      color: Colors.lightBlueAccent,
    ),
    Todo.withId(
      id: '2',
      taskName: '買い物は緑',
      category: '買い物',
      detail: '説明',
      day: '12/24(水)',
      isCheck: true,
      color: Colors.green,
    ),
    Todo.withId(
      id: '3',
      taskName: 'その他は青',
      category: 'その他',
      detail: '説明',
      day: '12/24(水)',
      isCheck: true,
      color: Colors.blue,
    ),
  ];

  Todo copyWith({
    String? id,
    String? taskName,
    String? category,
    String? detail,
    String? day,
    bool? isCheck,
    Color? color,
  }) {
    return Todo.withId(
      id: id ?? this.id,
      taskName: taskName ?? this.taskName,
      category: category ?? this.category,
      detail: detail ?? this.detail,
      day: day ?? this.day,
      isCheck: isCheck ?? this.isCheck,
      color: color ?? this.color,
    );
  }

  String toJson() {
    return jsonEncode({
      'id': id,
      '1': taskName,
      '2': category,
      '5': detail,
      '6': day,
      '7': isCheck,
      '8': color,
    });
  }

  factory Todo.fromJson(String json) {
    final mapData = jsonDecode(json);
    return Todo.withId(
      id: mapData['id'] as String,
      taskName: mapData['1'] as String,
      category: mapData['2'] as String,
      detail: mapData['5'] as String,
      day: mapData['6'] as String,
      isCheck: mapData['7'] as bool,
      color: mapData['8'] as Color,
    );
  }
}
