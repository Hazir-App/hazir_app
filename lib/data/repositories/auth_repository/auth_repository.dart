enum AuthStatus {
  unauthenticated,
  authenticated,
  unkown,
}
abstract class AuthRepository {
  Stream<AuthStatus> get status;  
  Future<void> signInWithMicrosoft();
  Future<void> signOut();
  void dispose();
}
