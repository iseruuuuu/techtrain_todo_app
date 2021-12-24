import 'dart:convert';
import 'package:flutter/cupertino.dart';

@immutable
class Todo {
  final String id;
  final String taskName;
  final String category;
  final String detail;
  final String day;

  Todo({
    required this.taskName,
    required this.category,
    required this.detail,
    required this.day,
  }) : id = DateTime.now().millisecondsSinceEpoch.toString();

  const Todo.withId({
    required this.id,
    required this.taskName,
    required this.category,
    required this.detail,
    required this.day,
  });

  static const initialTodos = [
    Todo.withId(
      id: '0',
      taskName: 'アプリメモ',
      category: '開発言語',
      detail: 'メモ',
      day: '11/11',
    ),
    Todo.withId(
      id: '1',
      taskName: '1',
      category: '1',
      detail: '1',
      day: '22/22',
    ),
    Todo.withId(
      id: '2',
      taskName: '2',
      category: '2',
      detail: '2',
      day: '33/33',
    ),
  ];

  Todo copyWith({
    String? id,
    String? taskName,
    String? category,
    String? detail,
    String? day,
  }) {
    return Todo.withId(
      id: id ?? this.id,
      taskName: taskName ?? this.taskName,
      category: category ?? this.category,
      detail: detail ?? this.detail,
      day: day ?? this.day,
    );
  }

  String toJson() {
    return jsonEncode({
      'id': id,
      '1': taskName,
      '2': category,
      '5': detail,
      '6': day,
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
    );
  }
}
