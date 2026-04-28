import 'package:flutter/material.dart';
import '../controller/task_controller.dart';
import '../../utils/student_info.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _saveTask() {
    if (_formKey.currentState!.validate()) {
      final taskController = TaskController();
      taskController.addTask(_controller.text.trim());
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thêm công việc'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: TextFormField(
            controller: _controller,
            autofocus: true,
            decoration: const InputDecoration(
              labelText: 'Tiêu đề công việc',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Vui lòng nhập tiêu đề công việc';
              }
              return null;
            },
            onFieldSubmitted: (_) => _saveTask(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveTask,
        child: const Icon(Icons.save),
      ),
      bottomNavigationBar: const StudentInfo(
        title: 'Ngô Minh Khôi - 6451071037',
      ),
    );
  }
}
