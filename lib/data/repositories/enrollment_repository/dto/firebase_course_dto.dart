import 'package:hazir_app/config/dto.dart';
import 'package:hazir_app/config/logger.dart';
import 'package:hazir_app/data/models/attendance.dart';
import 'package:hazir_app/data/models/course.dart';
import 'package:hazir_app/data/repositories/enrollment_repository/dto/firebase_attendance_dto.dart';

class FirebaseCourseDTO extends DTO<Map<String, dynamic>, Course> {
  final String code;
  const FirebaseCourseDTO(super.from, {required this.code});

  @override
  Course convert() {
    logger.i("List convert: ${from['attendance']}");
    return Course(
      component: "Lecture",
      code: code,
      absentCount: from['absent_count'],
      attendance: _parseAttendance(from['attendance']),
      classNumber: from['class_number'],
      courseName: from['course_name'],
      courseSection: from['course_section'],
      presentPercentage: from['present_percentage'],
      totalClasses: from['total_classes'],
      //TODO: Fix this
      allowedAbsenses: 4,
    );
  }

  List<Attendance> _parseAttendance(List attendanceMap) {
    logger.i("List: $attendanceMap");
    List<Attendance> attendance = <Attendance>[];
    for (var v in attendanceMap) {
      attendance.add(FirebaseAttendanceDTO(Map<String, String>.from(v as Map)).convert());
    }
    return attendance;
  }
}
