import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:hazir_app/config/dto.dart';
import 'package:hazir_app/data/repositories/user_repository/models/user/user.dart';

class FirebaseUserDTO extends DTO<firebase_auth.User, User> {
  FirebaseUserDTO(super.from);

  @override
  User toModel() {
    return User(name: from.displayName!, studentId: getStudentIdFromEmail(from.email!));
  }

  String getStudentIdFromEmail(String email){
    return email.substring(0, email.indexOf("@"));
  }
}
