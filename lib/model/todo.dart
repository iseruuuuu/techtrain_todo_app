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

  //値の更新をする際に必要なもの
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
      'taskName': taskName,
      'category': category,
      'detail': detail,
      'day': day,
      'isCheck': isCheck,
      'color': color,
      'deadline': deadline,
      'deadlineColor': deadlineColor,
    });
  }

  factory Todo.fromJson(String json) {
    final mapData = jsonDecode(json);
    return Todo.withId(
      id: mapData['id'] as String,
      taskName: mapData['taskName'] as String,
      category: mapData['category'] as String,
      detail: mapData['detail'] as String,
      day: mapData['day'] as String,
      isCheck: mapData['isCheck'] as bool,
      color: mapData['color'] as int,
      deadline: mapData['deadline'] as String,
      deadlineColor: mapData['deadlineColor'] as int,
    );
  }
}
