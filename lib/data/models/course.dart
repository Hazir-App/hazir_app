import 'package:equatable/equatable.dart';
import 'package:hazir_app/data/models/attendance.dart';
import 'package:hazir_app/data/models/enums/attendance_standing.dart';

class Course extends Equatable {
  final String code;
  final String component;
  final int absentCount;
  final List<Attendance> attendance;
  final String classNumber;
  final String courseName;
  final String courseSection;
  final int presentPercentage;
  final int totalClasses;
  final int allowedAbsenses;

  AttendanceStanding get attendanceStanding => AttendanceStanding.fromCourse(this);

  const Course({
    required this.component,
    required this.code,
    required this.absentCount,
    required this.attendance,
    required this.classNumber,
    required this.courseName,
    required this.courseSection,
    required this.presentPercentage,
    required this.totalClasses,
    required this.allowedAbsenses,
  });

  @override
  List<Object?> get props => [absentCount, attendance, classNumber, courseName, courseSection, presentPercentage, totalClasses, code, component, allowedAbsenses];
}
