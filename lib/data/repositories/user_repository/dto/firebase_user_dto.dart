import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:hazir_app/config/dto.dart';
import 'package:hazir_app/data/models/user.dart';

class FirebaseUserDTO extends DTO<firebase_auth.User, User> {
  FirebaseUserDTO(super.from);

  @override
  User convert() {
    return User(name: from.displayName!, studentId: _getStudentIdFromEmail(from.email!));
  }

  String _getStudentIdFromEmail(String email) {
    return email.substring(0, email.indexOf("@"));
  }
}
