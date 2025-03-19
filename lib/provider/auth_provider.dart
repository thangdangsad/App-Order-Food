import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? _currentUser;
  bool _isLoading = false;
  Map<String, dynamic>? _userData;

  User? get currentUser => _firebaseAuth.currentUser;
  bool get isLoading => _isLoading;
  Map<String, dynamic>? get userData => _userData;

  AuthService() {
    _firebaseAuth.authStateChanges().listen((user) {
      _currentUser = user;
      if (user != null) {
        fetchUserData();
      }
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
      UserCredential userCredential =
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Tạo document mới trong Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'email': email,
        'name': '',
        'gender': '',
        'birthdate': DateTime.now(),
      });

    } on FirebaseAuthException catch (e) {
      throw AuthException(message: _getErrorMessage(e.code));
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> fetchUserData() async {
    if (currentUser == null) return;

    DocumentReference docRef = FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid);

    DocumentSnapshot doc = await docRef.get();

    if (!doc.exists) {
      await docRef.set({
        'email': currentUser!.email,
        'name': '',
        'gender': '',
        'birthdate': DateTime.now(),
      });
    }

    _userData = doc.data() as Map<String, dynamic>?;
    notifyListeners();
  }

  Future<void> updateUserData({
    required String name,
    required String gender,
    required DateTime birthdate,
  }) async {
    if (currentUser == null) return;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .update({
      'name': name,
      'gender': gender,
      'birthdate': birthdate,
    });

    await fetchUserData();
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