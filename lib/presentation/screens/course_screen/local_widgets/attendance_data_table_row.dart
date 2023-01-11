import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'attendance_status_cell_row.dart';

enum AttendanceStatus {
  present,
  absent,
  notMarked;
}

class AttendanceDataTableRow extends DataRow {
  final DateTime date;
  final AttendanceStatus attendanceStatus;

  AttendanceDataTableRow(context, {required this.date, required this.attendanceStatus})
      : super(cells: [
          DataCell(Text(DateFormat.yMMMMd('en_US').format(date))),
          DataCell(AttendanceStatusCellRow(attendanceStatus: attendanceStatus)),
        ]);
}
