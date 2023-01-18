import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:hazir_app/data/repositories/user_repository/models/user/firebase_user_dto.dart';
import 'package:hazir_app/data/repositories/user_repository/user_repository.dart';

import 'models/user/user.dart';

class FirebaseUserRepository implements UserRepository {
  final firebase_auth.FirebaseAuth _auth;

  FirebaseUserRepository() : _auth = firebase_auth.FirebaseAuth.instance;

  @override
  User get currentUser => _auth.currentUser != null ? FirebaseUserDTO(_auth.currentUser!).toModel() : User.empty;

  @override
  Future<void> getCurrentUserData() {
    return Future.value();
  }

  @override
  void clearCurrentUserData() {
    _auth.currentUser?.reload();
  }
}
