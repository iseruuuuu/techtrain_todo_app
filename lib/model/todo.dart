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
