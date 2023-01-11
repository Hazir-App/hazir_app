import 'package:flutter/material.dart';

import 'attendance_data_table_row.dart';

class AttendanceStatusCellRow extends StatelessWidget {
  final AttendanceStatus attendanceStatus;
  const AttendanceStatusCellRow({
    Key? key,
    required this.attendanceStatus,
  }) : super(key: key);

  String _getAttendanceStatusString() {
    if (attendanceStatus == AttendanceStatus.absent) {
      return 'Absent';
    } else if (attendanceStatus == AttendanceStatus.present) {
      return 'Present';
    } else {
      return 'N/A';
    }
  }

  IconData _getIconData(context) {
    if (attendanceStatus == AttendanceStatus.present) {
      return Icons.check_circle;
    } else if (attendanceStatus == AttendanceStatus.absent) {
      return Icons.cancel;
    } else {
      return Icons.help;
    }
  }

  Color _getColor(context) {
    if (attendanceStatus == AttendanceStatus.present) {
      return Theme.of(context).colorScheme.primary;
    } else if (attendanceStatus == AttendanceStatus.absent) {
      return Theme.of(context).colorScheme.secondaryContainer;
    }
    return Theme.of(context).colorScheme.surfaceVariant;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          _getIconData(context),
          size: 14,
          color: _getColor(context),
        ),
        const SizedBox(width: 4),
        Text(_getAttendanceStatusString(), style: Theme.of(context).textTheme.bodySmall?.copyWith(color: _getColor(context)))
      ],
    );
  }
}
