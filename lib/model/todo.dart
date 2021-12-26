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
  final int color;
  final String deadline;
  final int deadlineColor;

  Todo({
    required this.taskName,
    required this.category,
    required this.detail,
    required this.day,
    required this.isCheck,
    required this.color,
    required this.deadline,
    required this.deadlineColor,
  }) : id = DateTime.now().millisecondsSinceEpoch.toString();

  const Todo.withId({
    required this.id,
    required this.taskName,
    required this.category,
    required this.detail,
    required this.day,
    required this.isCheck,
    required this.color,
    required this.deadline,
    required this.deadlineColor,
  });

  static const initialTodos = [
    Todo.withId(
      id: '0',
      taskName: '個人は紫dsadsddsdadsdadaddaadsadda',
      category: '個人',
      detail: '説明',
      day: '12/24(水)',
      isCheck: false,
      color: 0xFFA2A0EB,
      deadline: '今日まで',
      deadlineColor: 0xFF2654CD,
    ),
    Todo.withId(
      id: 'ああああ',
      taskName: '仕事は水色',
      category: '仕事',
      detail: '説明',
      day: '12/24(水)',
      isCheck: false,
      color: 0xFF75AED7,
      deadline: '1日前',
      deadlineColor: 0xFFF96983,
    ),
    Todo.withId(
      id: '2',
      taskName: '買い物は緑',
      category: '買い物',
      detail: '説明',
      day: '12/24(水)',
      isCheck: true,
      color: 0xFF4EC88D,
      deadline: '2日前',
      deadlineColor: 0xFFF96983,
    ),
    Todo.withId(
      id: '3',
      taskName: 'その他は青',
      category: 'その他',
      detail: '説明',
      day: '12/24(水)',
      isCheck: true,
      color: 0xFF75AED7,
      deadline: '3日前',
      deadlineColor: 0xFFF96983,
    ),
  ];

  Todo copyWith({
    String? id,
    String? taskName,
    String? category,
    String? detail,
    String? day,
    bool? isCheck,
    int? color,
    String? deadline,
    int? deadlineColor,
  }) {
    return Todo.withId(
      id: id ?? this.id,
      taskName: taskName ?? this.taskName,
      category: category ?? this.category,
      detail: detail ?? this.detail,
      day: day ?? this.day,
      isCheck: isCheck ?? this.isCheck,
      color: color ?? this.color,
      deadline: deadline ?? this.deadline,
      deadlineColor: deadlineColor ?? this.deadlineColor,
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
      '9': deadline,
      '10': deadlineColor,
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
      color: mapData['8'] as int,
      deadline: mapData['9'] as String,
      deadlineColor: mapData['10'] as int,
    );
  }
}
