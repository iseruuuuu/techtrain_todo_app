import 'dart:convert';
import 'package:flutter/cupertino.dart';

@immutable
class Todo {
  final String id;
  final String taskName;
  final String category;
  final String detail;
  final String day;
  final bool isCheck;

  Todo({
    required this.taskName,
    required this.category,
    required this.detail,
    required this.day,
    required this.isCheck,
  }) : id = DateTime.now().millisecondsSinceEpoch.toString();

  const Todo.withId({
    required this.id,
    required this.taskName,
    required this.category,
    required this.detail,
    required this.day,
    required this.isCheck,
  });

  static const initialTodos = [
    Todo.withId(
      id: '0',
      taskName: 'アプリメモ',
      category: '開発言語',
      detail: 'メモ',
      day: '11/11',
      isCheck: false,
    ),
    Todo.withId(
      id: 'ああああ',
      taskName: 'あああ',
      category: 'あああ',
      detail: 'ああああ',
      day: '22/22',
      isCheck: false,
    ),
    Todo.withId(
      id: '2',
      taskName: '2',
      category: '2',
      detail: '2',
      day: '33/33',
      isCheck: true,
    ),
  ];

  Todo copyWith({
    String? id,
    String? taskName,
    String? category,
    String? detail,
    String? day,
    bool? isCheck,
  }) {
    return Todo.withId(
      id: id ?? this.id,
      taskName: taskName ?? this.taskName,
      category: category ?? this.category,
      detail: detail ?? this.detail,
      day: day ?? this.day,
      isCheck: isCheck ?? this.isCheck
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
    );
  }
}
