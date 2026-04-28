import 'package:flutter/material.dart';

class StudentInfo extends StatelessWidget {
  final String title;

  const StudentInfo({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }
}
