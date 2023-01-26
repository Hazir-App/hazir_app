import 'package:hazir_app/data/models/enrollment.dart';
import 'package:hazir_app/data/models/user.dart';

abstract class EnrollmentRepository {
  Enrollment? get enrollment;
  Future<void> getEnrollment(User user, String semesterCode);
}
