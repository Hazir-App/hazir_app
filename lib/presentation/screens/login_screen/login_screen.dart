import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hazir_app/config/logger.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static String get route => "/login";

  Future<UserCredential?> signInWithMicrosoft() async {
    final microsoftProvider = MicrosoftAuthProvider();
    UserCredential? userCredential;
    try {
      if (kIsWeb) {
        userCredential = await FirebaseAuth.instance.signInWithPopup(microsoftProvider);
      } else {
        userCredential = await FirebaseAuth.instance.signInWithProvider(microsoftProvider);
      }
      return userCredential;
    } on FirebaseAuthException catch (e) {
      logger.e(e.message);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(onPressed: () async => signInWithMicrosoft(), child: const Text("jjj")),
    );
  }
}
