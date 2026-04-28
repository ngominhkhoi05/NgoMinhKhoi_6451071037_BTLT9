import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel? get currentUser {
    final user = _auth.currentUser;
    if (user == null) return null;
    return UserModel(uid: user.uid, email: user.email ?? '');
  }

  Stream<UserModel?> get userStream {
    return _auth.authStateChanges().map((user) {
      if (user == null) return null;
      return UserModel(uid: user.uid, email: user.email ?? '');
    });
  }

  Future<String?> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return _mapError(e.code);
    }
  }

  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return _mapError(e.code);
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  String _mapError(String code) {
    switch (code) {
      case 'invalid-email':
        return 'Email không hợp lệ.';
      case 'user-disabled':
        return 'Tài khoản đã bị vô hiệu hóa.';
      case 'user-not-found':
        return 'Không tìm thấy tài khoản.';
      case 'wrong-password':
        return 'Mật khẩu không đúng.';
      case 'email-already-in-use':
        return 'Email đã được sử dụng.';
      case 'weak-password':
        return 'Mật khẩu quá yếu (ít nhất 6 ký tự).';
      case 'invalid-credential':
        return 'Thông tin đăng nhập không hợp lệ.';
      default:
        return 'Đã xảy ra lỗi. Vui lòng thử lại.';
    }
  }
}
