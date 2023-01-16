import 'package:hazir_app/data/enums/auth_status.dart';

abstract class AuthRepository {
  Stream<AuthStatus> get status;
  Future<void> signInWithMicrosoft();
  Future<void> signOut();
  void dispose();
}
