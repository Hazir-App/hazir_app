import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:hazir_app/data/repositories/user_repository/dto/firebase_user_dto.dart';
import 'package:hazir_app/data/repositories/user_repository/user_repository.dart';

import '../../models/user.dart';

class FirebaseUserRepository implements UserRepository {
  final firebase_auth.FirebaseAuth _auth;

  FirebaseUserRepository() : _auth = firebase_auth.FirebaseAuth.instance;

  User _currentUser = User.empty;

  @override
  User get currentUser => _currentUser;

  @override
  Future<void> getCurrentUserData() {
    if(_auth.currentUser!=null){
      _currentUser = FirebaseUserDTO(_auth.currentUser!).convert();
    }
    return Future.value();
  }

  @override
  void clearCurrentUserData() {
    _auth.currentUser?.reload();
  }
}
