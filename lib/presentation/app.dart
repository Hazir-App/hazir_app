import 'package:flutter/material.dart';
import 'package:hazir_app/presentation/theme/hazir_theme.dart';
import 'package:hazir_app/presentation/screens/home_screen/home_screen.dart';
import 'package:hazir_app/routes/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: HazirTheme.instance.getTheme(context, isLight: true),
      darkTheme: HazirTheme.instance.getTheme(context, isLight:false),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      routes: Routes.register,
    );
  }
}
