
import 'package:flutter/material.dart';
import 'package:hazir_app/presentation/screens/course_screen/course_screen.dart';
import 'package:hazir_app/presentation/screens/home_screen/home_screen.dart';
import 'package:hazir_app/presentation/screens/login_screen/login_screen.dart';
import 'package:hazir_app/presentation/screens/splash_screen/splash_screen.dart';


Map<String, WidgetBuilder> routes = {
        HomeScreen.route: (context) => const HomeScreen(),
        CourseScreen.route: (context) => const CourseScreen(),
        LoginScreen.route: (context) => const LoginScreen(),
        SplashScreen.route: ((context) => const SplashScreen())
};

