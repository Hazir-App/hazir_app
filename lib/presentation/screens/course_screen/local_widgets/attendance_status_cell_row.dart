import 'package:flutter/material.dart';
import 'package:hazir_app/data/models/enums/attendance_status.dart';

class AttendanceStatusCellRow extends StatelessWidget {
  final AttendanceStatus attendanceStatus;
  const AttendanceStatusCellRow({
    Key? key,
    required this.attendanceStatus,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          attendanceStatus.getIconData(),
          size: 14,
          color: attendanceStatus.getColor(Theme.of(context).colorScheme),
        ),
        const SizedBox(width: 4),
        Text(attendanceStatus.getAttendanceStatusString(), style: Theme.of(context).textTheme.bodySmall?.copyWith(color: attendanceStatus.getColor(Theme.of(context).colorScheme)))
      ],
    );
  }
}
