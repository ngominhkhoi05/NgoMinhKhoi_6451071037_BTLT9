import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String? id;
  final String title;
  final bool isDone;
  final Timestamp createdAt;

  TaskModel({
    this.id,
    required this.title,
    this.isDone = false,
    required this.createdAt,
  });

  factory TaskModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TaskModel(
      id: doc.id,
      title: data['title'] as String? ?? '',
      isDone: data['isDone'] as bool? ?? false,
      createdAt: data['createdAt'] as Timestamp? ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
      'createdAt': createdAt,
    };
  }

  TaskModel copyWith({
    String? id,
    String? title,
    bool? isDone,
    Timestamp? createdAt,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
