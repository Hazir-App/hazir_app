import 'package:flutter/material.dart';
import 'package:hazir_app/presentation/screens/course_screen/course_screen.dart';

import '../presentation/screens/home_screen/home_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> get register => {
        HomeScreen.screenName: (context) => const HomeScreen(),
        CourseScreen.screenName : (context) => const CourseScreen(),
      };
}
