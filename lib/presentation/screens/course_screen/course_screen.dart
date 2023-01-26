// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hazir_app/data/models/attendance.dart';
import 'package:hazir_app/data/models/course.dart';

import 'package:hazir_app/presentation/widgets/hazir_app_bar.dart';

import 'local_widgets/attendance_data_table_row.dart';
import 'local_widgets/course_info.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  static String get route => '/course';

  @override
  Widget build(BuildContext context) {
    final Course course = ModalRoute.of(context)!.settings.arguments as Course;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        leadingWidth: 45,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onPrimary,
            size: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          course.courseName,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(12),
          ),
        ),
        bottom: HazirAppBar(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CourseInfo(title: 'Component', data: course.component),
                    CourseInfo(title: 'Section', data: course.courseSection),
                    CourseInfo(title: 'Absences', data: course.absentCount.toString()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DataTable(
                sortAscending: false,
                showBottomBorder: true,
                columns: const [
                  DataColumn(
                    label: Text('Date'),
                  ),
                  DataColumn(
                    label: Text('Status'),
                  ),
                ],
                rows: course.attendance
                    .map(
                      (Attendance attendance) => AttendanceDataTableRow(
                        context,
                        date: attendance.date,
                        attendanceStatus: attendance.attendanceStatus,
                      ),
                    )
                    .toList(),
               
              )
            ],
          ),
        ),
      ),
    );
  }
}
