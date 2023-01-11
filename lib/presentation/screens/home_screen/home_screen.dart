import 'package:flutter/material.dart';
import 'package:hazir_app/hazir_theme/elevation.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello,', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
            Text('Firstname', style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
            Text('Updated 12 hours ago', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
          ],
        ),
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(12),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8, childAspectRatio: 0.9),
        padding: const EdgeInsets.all(16),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
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
          );
        },
      ),
    );
  }
}
