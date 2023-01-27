import 'package:hazir_app/config/dto.dart';
import 'package:hazir_app/config/logger.dart';
import 'package:hazir_app/data/models/course.dart';
import 'package:hazir_app/data/models/enrollment.dart';
import 'package:hazir_app/data/repositories/enrollment_repository/dto/firebase_course_dto.dart';

class FirebaseEnrollmentDTO extends DTO<Map<String, dynamic>, Enrollment> {
  final String semesterId;
  FirebaseEnrollmentDTO(super.from,{required this.semesterId});

  @override
  Enrollment convert() {
    logger.i("convert: $from");
    return Enrollment(
      courses: _parseCourses(Map<String, dynamic>.from((from['courses'] as Map))),
      semesterId: semesterId,
      lastUpdated: DateTime.parse(from['last_updated'])
    );
  }

  List<Course> _parseCourses(Map<String,dynamic> coursesMap) {
    logger.i("parseCourse: $from");
    List<Course> courses = [];
    for (final String courseId in coursesMap.keys.toList()) {
      courses.add(FirebaseCourseDTO(Map<String, dynamic>.from((coursesMap[courseId] as Map)), code: courseId).convert());
    }
    return courses;
  }
}
