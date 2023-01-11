import 'package:flutter/material.dart';
import 'package:hazir_app/presentation/screens/home_screen/local_widgets/course_attendance_card.dart';
import 'package:hazir_app/presentation/widgets/hazir_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String get screenName => "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HazirAppBar(
        toolbarHeight: 100,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello,', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
              Text('Firstname', style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
              Text('Updated 12 hours ago', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8, childAspectRatio: 0.9),
        padding: const EdgeInsets.all(16),
        itemCount: 8,
        itemBuilder: (context, index) {
          return const CourseAttendaceCard();
        },
      ),
    );
  }
}
