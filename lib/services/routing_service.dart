import 'package:flutter/material.dart';
import 'package:hazir_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:hazir_app/presentation/screens/login_screen/login_screen.dart';
import 'package:hazir_app/presentation/screens/splash_screen/splash_screen.dart';

import '../presentation/screens/home_screen/home_screen.dart';

class RoutingService {
  Map<String, WidgetBuilder> routes;
  
  RoutingService({required this.routes});

  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'main');

  void handleAuthenticationRouting(AuthStatus authStatus) {
    switch (authStatus) {
      case AuthStatus.authenticated:
        navigatorKey.currentState?.pushNamedAndRemoveUntil(HomeScreen.route, (route) => false);
        break;
      case AuthStatus.unauthenticated:
        navigatorKey.currentState?.pushNamedAndRemoveUntil(LoginScreen.route, (route) => false);
        break;
      case AuthStatus.unkown:
        break;
    }
  }

  String get initialRoute => SplashScreen.route;

}
