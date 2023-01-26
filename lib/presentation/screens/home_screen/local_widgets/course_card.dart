import 'package:flutter/material.dart';
import 'package:hazir_app/data/models/course.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:hazir_app/presentation/screens/course_screen/course_screen.dart';
import 'package:hazir_app/presentation/theme/elevation.dart';

class CourseCard extends StatelessWidget {
  final Course? course;
  const CourseCard({
    this.course,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (course != null) {
          Navigator.of(context).pushNamed(CourseScreen.route, arguments: course!);
        }
      },
      child: Container(
        decoration: Theme.of(context).extension<Elevation>()?.style1?.copyWith(
              borderRadius: BorderRadius.circular(12),
            ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              radius: 55.0,
              lineWidth: 12.0,
              animation: true,
              percent: course != null ? 1 - course!.absentCount / course!.allowedAbsenses : 0,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${course?.absentCount ?? 0}/${course?.allowedAbsenses ?? 0}",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: course?.attendanceStanding.getTextColor(Theme.of(context).colorScheme, subheading: false),
                        ),
                  ),
                  Text("Absents",
                      style: Theme.of(context).textTheme.caption!.copyWith(
                            color: course?.attendanceStanding.getTextColor(Theme.of(context).colorScheme, subheading: true),
                          )),
                ],
              ),
              footer: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    course?.courseName ?? "Course Name",
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    course?.component ?? "Course Type",
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1,
                    softWrap: true,
                  )
                ],
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: course?.attendanceStanding.getPrimraryColor(Theme.of(context).colorScheme),
              backgroundColor: course?.attendanceStanding.getSecondaryColor(Theme.of(context).colorScheme) ?? Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
            ),
          ],
        ),
      ),
    );
  }
}
