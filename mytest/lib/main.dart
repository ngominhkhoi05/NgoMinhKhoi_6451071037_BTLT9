import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'cau1/apps/todo_app.dart';
import 'cau2/apps/auth_app.dart';
import 'firebase_options.dart';
import 'utils/student_info.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TBDD Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chọn bài thực hành'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.apps, size: 80, color: Colors.blue),
              const SizedBox(height: 32),
              const Text(
                'Danh sách bài thực hành',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const TodoApp()),
                    );
                  },
                  icon: const Icon(Icons.checklist),
                  label: const Text(
                    'Câu 1: To-do List\n(Firestore CRUD)',
                    textAlign: TextAlign.center,
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AuthApp()),
                    );
                  },
                  icon: const Icon(Icons.login),
                  label: const Text(
                    'Câu 2: Authentication\n(Đăng ký / Đăng nhập)',
                    textAlign: TextAlign.center,
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const StudentInfo(
        title: 'Ngô Minh Khôi - 6451071037',
      ),
    );
  }
}
