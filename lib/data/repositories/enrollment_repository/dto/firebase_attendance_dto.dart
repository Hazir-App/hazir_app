import 'package:hazir_app/config/dto.dart';
import 'package:hazir_app/data/models/attendance.dart';
import 'package:hazir_app/data/models/enums/attendance_status.dart';

class FirebaseAttendanceDTO extends DTO<Map<String, dynamic>, Attendance> {
  const FirebaseAttendanceDTO(super.from);

  @override
  Attendance convert() {
    return Attendance(
      date: DateTime.now(),
      attendanceStatus: _parseAttendanceStatus(from['present_status']),
    );
  }

  AttendanceStatus _parseAttendanceStatus(String attendanceStatus) {
    switch (attendanceStatus) {
      case "N":
        return AttendanceStatus.absent;
      case "Y":
        return AttendanceStatus.present;
      case "X":
        return AttendanceStatus.notMarked;
      default:
        return AttendanceStatus.notMarked;
    }
  }
}
