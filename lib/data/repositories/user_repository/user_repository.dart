import 'package:hazir_app/data/repositories/user_repository/models/user/user.dart';

abstract class UserRepository {
  User get currentUser;
  Future<void> getCurrentUserData();
  void clearCurrentUserData();
}
