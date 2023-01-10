import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hazir_app/config/logger.dart';

class Bootstrap {
  static Future<void> wrap(FutureOr<Widget> Function() builder) async {
    await runZonedGuarded(
      () async {   
        WidgetsFlutterBinding.ensureInitialized();
        runApp(await builder());

      },
      (error, stackTrace) => logger.e('Exception', error, stackTrace),
    );
  }
}

