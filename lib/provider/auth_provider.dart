import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? _currentUser;
  bool _isLoading = false;

  User? get currentUser => _firebaseAuth.currentUser;
  bool get isLoading => _isLoading;
  AuthService() {
    _firebaseAuth.authStateChanges().listen((user) {
      _currentUser = user;
      notifyListeners();
    });
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      _setLoading(true);
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: _getErrorMessage(e.code));
    } finally {
      _setLoading(false);
    }
  }

  Future<void> registerWithEmail(String email, String password) async {
    try {
      _setLoading(true);
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: _getErrorMessage(e.code));
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  String _getErrorMessage(String code) {
    switch (code) {
      case 'user-not-found':
        return 'Tài khoản không tồn tại';
      case 'wrong-password':
        return 'Mật khẩu không chính xác';
      case 'email-already-in-use':
        return 'Email đã được đăng ký';
      case 'weak-password':
        return 'Mật khẩu quá yếu';
      default:
        return 'Đã xảy ra lỗi. Vui lòng thử lại';
    }
  }
}

class AuthException implements Exception {
  final String message;
  AuthException({required this.message});
}