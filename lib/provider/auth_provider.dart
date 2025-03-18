import 'package:cloud_firestore/cloud_firestore.dart';
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

    AuthService() {
      _firebaseAuth.authStateChanges().listen((user) {
        _currentUser = user;
        if (user != null) {
          fetchUserData(); // Tải dữ liệu khi đăng nhập
        }
        notifyListeners();
      });
    }
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
  Map<String, dynamic>? _userData;

  Map<String, dynamic>? get userData => _userData;

  Future<void> fetchUserData() async {
    if (currentUser == null) return;
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .get();
    _userData = doc.data();
    notifyListeners();
  }

  Future<void> updateBirthdate(DateTime newDate) async {
    if (currentUser == null) return;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid) // Sử dụng UID làm document ID
        .update({'birthdate': newDate});

    await fetchUserData(); // Cập nhật lại dữ liệu cục bộ
  }

  // Thêm phương thức này vào constructor

  Future<void> updateUserData({
    required String name,
    required String gender,
    required DateTime birthdate,
  }) async {
    if (currentUser == null) return;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid) // Sử dụng UID làm document ID
        .update({
      'name': 'Tên mặc định',
      'email': currentUser!.email,
      'gender': 'Nam',
      'birthdate': DateTime.now(),
    });

    await fetchUserData(); // Cập nhật lại dữ liệu
  }
}

class AuthException implements Exception {
  final String message;
  AuthException({required this.message});
}