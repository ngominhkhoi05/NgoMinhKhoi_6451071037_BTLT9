import 'package:flutter/material.dart';
import '../controller/task_controller.dart';
import '../models/task_model.dart';
import '../widget/task_item.dart';
import '../../utils/student_info.dart';
import 'add_task_screen.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = TaskController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách công việc'),
      ),
      body: StreamBuilder<List<TaskModel>>(
        stream: taskController.getTasks(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          }
          final tasks = snapshot.data ?? [];
          if (tasks.isEmpty) {
            return const Center(
              child: Text('Chưa có công việc nào'),
            );
          }
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return TaskItem(
                task: task,
                onToggle: (isDone) {
                  taskController.toggleDone(task.id!, isDone);
                },
                onDelete: () {
                  taskController.deleteTask(task.id!);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTaskScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const StudentInfo(
        title: 'Ngô Minh Khôi - 6451071037',
      ),
    );
  }
}
