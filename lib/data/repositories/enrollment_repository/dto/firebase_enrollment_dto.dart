import 'package:hazir_app/config/dto.dart';
import 'package:hazir_app/data/models/course.dart';
import 'package:hazir_app/data/models/enrollment.dart';
import 'package:hazir_app/data/repositories/enrollment_repository/dto/firebase_course_dto.dart';

class FirebaseEnrollmentDTO extends DTO<Map<String, dynamic>, Enrollment> {
  final String semesterId;
  FirebaseEnrollmentDTO(super.from,{required this.semesterId});

  @override
  Enrollment convert() {
    return Enrollment(
      courses: _parseCourses(from['courses']),
      semesterId: semesterId,
      //TODO: Fix this
      lastUpdated: DateTime.now(),
    );
  }

  List<Course> _parseCourses(Map<String,dynamic> coursesMap) {
    List<Course> courses = [];
    for (final String courseId in coursesMap.keys.toList()) {
      courses.add(FirebaseCourseDTO(coursesMap[courseId], code: courseId).convert());
    }
    return courses;
  }
}
