import 'package:flutter/material.dart';
import 'package:hazir_app/presentation/theme/elevation.dart';
import 'package:hazir_app/presentation/screens/course_screen/course_screen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CourseAttendaceCard extends StatelessWidget {
  const CourseAttendaceCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(CourseScreen.route);
      },
      child: Container(
        decoration: Theme.of(context).extension<Elevation>()?.style1?.copyWith(
              borderRadius: BorderRadius.circular(12),
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              radius: 50.0,
              lineWidth: 15.0,
              animation: true,
              percent: 0.5,
              center: Text(
                "50%",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              footer: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Ethics OF AI",
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    maxLines: 2,
                  ),
                  Text(
                    "Lecture",
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1,
                    softWrap: true,
                  )
                ],
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
