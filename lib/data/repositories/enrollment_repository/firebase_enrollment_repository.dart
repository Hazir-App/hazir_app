import 'package:firebase_database/firebase_database.dart';
import 'package:hazir_app/config/logger.dart';
import 'package:hazir_app/data/models/enrollment.dart';
import 'package:hazir_app/data/models/user.dart';
import 'package:hazir_app/data/repositories/enrollment_repository/dto/firebase_enrollment_dto.dart';
import 'package:hazir_app/data/repositories/enrollment_repository/enrollment_repository.dart';

class FirebaseEnrollmentRepository implements EnrollmentRepository {
  final FirebaseDatabase db;
  FirebaseEnrollmentRepository() : db = FirebaseDatabase.instance;
  Enrollment? _enrollment;
  @override
  Enrollment? get enrollment => _enrollment;

  @override
  Future<void> getEnrollment(User user, String semesterCode) async {
    final ref = db.ref("$semesterCode/${user.studentNumber}");
    final snapshot = await ref.get();
    if (!snapshot.exists) {
      logger.e("FirebaseEnrollmentRepository: getEnrollment: data is null");
      return;
    }
    _enrollment = FirebaseEnrollmentDTO(snapshot.value as Map<String, dynamic>, semesterId: semesterCode).convert();
    await Future.delayed(const Duration(seconds: 1));
    return;
  }
}
