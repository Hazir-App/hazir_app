import 'package:flutter/material.dart';
import 'package:hazir_app/data/models/course.dart';

enum AttendanceStanding {
  good,
  warning,
  bad;

  factory AttendanceStanding.fromCourse(Course course) {
    if (course.absentCount == 0) {
      return AttendanceStanding.good;
    } else if (course.absentCount < course.allowedAbsenses - 1) {
      return AttendanceStanding.warning;
    } else {
      return AttendanceStanding.bad;
    }
  }

  Color getPrimraryColor(ColorScheme colorScheme) {
    switch (this) {
      case AttendanceStanding.good:
        return colorScheme.primary;
      case AttendanceStanding.warning:
        return colorScheme.secondary;
      case AttendanceStanding.bad:
        return colorScheme.error;
    }
  }

  Color getSecondaryColor(ColorScheme colorScheme) {
    return getPrimraryColor(colorScheme).withOpacity(0.5);
  }

  Color getTextColor(ColorScheme colorScheme, {bool subheading = false}) {
    switch (this) {
      case AttendanceStanding.good:
        return colorScheme.onSurface;
      case AttendanceStanding.warning:
        return colorScheme.onSurface;
      case AttendanceStanding.bad:
        return colorScheme.error.withOpacity(subheading ? 0.5 : 1);
    }
  }
}
