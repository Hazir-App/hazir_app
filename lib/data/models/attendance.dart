import 'package:equatable/equatable.dart';
import 'package:hazir_app/data/models/enums/attendance_status.dart';

class Attendance extends Equatable {
  final DateTime date;
  final AttendanceStatus attendanceStatus;

  const Attendance({required this.date,required this.attendanceStatus});

  @override
  List<Object?> get props => [date, attendanceStatus];

}
