import 'package:hazir_app/data/models/user.dart';

abstract class UserRepository {
  User get currentUser;
  Future<void> getCurrentUserData();
  void clearCurrentUserData();
}
