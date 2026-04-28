import 'package:flutter/material.dart';
import '../models/task_model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;
  final Function(bool) onToggle;
  final VoidCallback onDelete;

  const TaskItem({
    super.key,
    required this.task,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(task.id!),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: CheckboxListTile(
        value: task.isDone,
        onChanged: (value) => onToggle(value ?? false),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isDone ? TextDecoration.lineThrough : null,
            color: task.isDone ? Colors.grey : null,
          ),
        ),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
