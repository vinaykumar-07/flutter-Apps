
class Todo {
  final int? id;
  final String title;
  final String description;
  final String priority;
  bool completed;

  Todo({
    this.id,
    required this.title,
    required this.description,
    required this.priority,
    this.completed = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'priority': priority,
      'completed': completed ? 1 : 0,
    };
  }

  Todo copyWith({
    int? id,
    String? title,
    String? description,
    String? priority,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      completed: completed ?? this.completed,
    );
  }
}