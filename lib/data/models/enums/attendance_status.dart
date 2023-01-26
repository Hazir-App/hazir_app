import 'package:flutter/material.dart';

enum AttendanceStatus {
  present,
  absent,
  notMarked;


  String getAttendanceStatusString() {
    if (this == AttendanceStatus.absent) {
      return 'Absent';
    } else if (this == AttendanceStatus.present) {
      return 'Present';
    } else {
      return 'N/A';
    }
  }


  IconData getIconData() {
    if (this == AttendanceStatus.present) {
      return Icons.check_circle;
    } else if (this == AttendanceStatus.absent) {
      return Icons.cancel;
    } else {
      return Icons.help;
    }
  }

  Color getColor(ColorScheme colorScheme) {
    if (this == AttendanceStatus.present) {
      return colorScheme.primary;
    } else if (this == AttendanceStatus.absent) {
      return colorScheme.secondary;
    }
    return colorScheme.surfaceVariant;
  }
}
