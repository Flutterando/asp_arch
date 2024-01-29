class TodoModel {
  final int id;
  final String title;
  final bool check;

  TodoModel({
    required this.id,
    required this.title,
    required this.check,
  });

  TodoModel copyWith({
    int? id,
    String? title,
    bool? check,
  }) {
    return TodoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      check: check ?? this.check,
    );
  }
}
