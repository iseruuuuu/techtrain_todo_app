# techtrain_todo_app

##値の例

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



##更新するためのメソッド

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