import 'package:firebase_database/firebase_database.dart';
import 'package:hazir_app/config/logger.dart';
import 'package:hazir_app/data/models/enrollment.dart';
import 'package:hazir_app/data/models/user.dart';
import 'package:hazir_app/data/repositories/enrollment_repository/dto/firebase_enrollment_dto.dart';
import 'package:hazir_app/data/repositories/enrollment_repository/enrollment_repository.dart';

class FirebaseEnrollmentRepository implements EnrollmentRepository {
  final DatabaseReference ref = FirebaseDatabase.instance.ref("https://hazir-dev.firebaseio.com/");
  Enrollment? _enrollment;
  @override
  Enrollment? get enrollment => _enrollment;

  @override
  Future<void> getEnrollment(User user, String semesterCode) async {
    final snapshot = await ref.child("${semesterCode}/${user.studentNumber}").get();
    if (!snapshot.exists) {
      logger.e("FirebaseEnrollmentRepository: getEnrollment: data is null");
      return;
    }
    _enrollment = FirebaseEnrollmentDTO(snapshot.value as Map<String, dynamic>, semesterId: semesterCode).convert();
    await Future.delayed(const Duration(seconds: 1));
    return;
  }
}
