class Todo {
  final int id;
  final String label;
  final int checked;
  final int task_id;

  Todo({this.id, this.label, this.checked, this.task_id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'label': label,
      'checked': checked,
      'task_id': task_id
    };
  }
}