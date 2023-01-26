import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:hazir_app/data/exceptions/auth_exception.dart';
import 'package:hazir_app/data/repositories/auth_repository/auth_repository.dart';

class FirebaseAuthRepository implements AuthRepository {
  final _controller = StreamController<AuthStatus>();
  final FirebaseAuth _auth;
  final MicrosoftAuthProvider _microsoftAuthProvider;

  FirebaseAuthRepository()
      : _auth = FirebaseAuth.instance,
        _microsoftAuthProvider = MicrosoftAuthProvider() {
    _controller.add(AuthStatus.unkown);
    Future.delayed(const Duration(microseconds: 500))
        .then((value) => _auth.authStateChanges().forEach((user) => _controller.add(user == null ? AuthStatus.unauthenticated : AuthStatus.authenticated)));
  }

  @override
  void dispose() => _controller.close();

  @override
  Future<void> signInWithMicrosoft() async {
    try {
      if (kIsWeb) {
        await _auth.signInWithPopup(_microsoftAuthProvider);
      } else {
        await _auth.signInWithProvider(_microsoftAuthProvider);
      }
      if (_auth.currentUser == null || !_auth.currentUser!.email!.contains("@st.habib.edu.pk")) {
        await _auth.signOut();
        throw AuthException(message: "You are not a student of Habib University", statusCode: "invalid-email");
      }
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message, statusCode: e.code, stackTrace: e.stackTrace);
    }
  }

  @override
  Stream<AuthStatus> get status => _controller.stream;

  @override
  Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }
}
