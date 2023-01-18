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
        await FirebaseAuth.instance.signInWithPopup(_microsoftAuthProvider);
      } else {
        await FirebaseAuth.instance.signInWithProvider(_microsoftAuthProvider);
      }
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.message, statusCode: e.code);
    }
  }

  @override
  Stream<AuthStatus> get status => _controller.stream;

  @override
  Future<void> signOut() {
    return FirebaseAuth.instance.signOut();
  }
}
