import 'package:flutter/material.dart';
import 'package:hazir_app/data/models/enums/attendance_status.dart';
import 'package:intl/intl.dart';

import 'attendance_status_cell_row.dart';


class AttendanceDataTableRow extends DataRow {
  final DateTime date;
  final AttendanceStatus attendanceStatus;

  AttendanceDataTableRow(context, {required this.date, required this.attendanceStatus})
      : super(cells: [
          DataCell(Text(DateFormat.yMMMMd('en_US').format(date))),
          DataCell(AttendanceStatusCellRow(attendanceStatus: attendanceStatus)),
        ]);
}
