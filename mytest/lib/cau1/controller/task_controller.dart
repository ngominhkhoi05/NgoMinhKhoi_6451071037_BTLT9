import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task_model.dart';

class TaskController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference get _tasksRef => _firestore.collection('tasks');

  Stream<List<TaskModel>> getTasks() {
    return _tasksRef.orderBy('createdAt', descending: true).snapshots().map(
          (snapshot) => snapshot.docs.map((doc) => TaskModel.fromDocument(doc)).toList(),
        );
  }

  Future<void> addTask(String title) async {
    await _tasksRef.add({
      'title': title,
      'isDone': false,
      'createdAt': Timestamp.now(),
    });
  }

  Future<void> toggleDone(String id, bool isDone) async {
    await _tasksRef.doc(id).update({'isDone': isDone});
  }

  Future<void> deleteTask(String id) async {
    await _tasksRef.doc(id).delete();
  }
}
