import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hazir_app/config/logger.dart';
import 'package:hazir_app/firebase_options.dart';

class Bootstrap {
  static Future<void> wrap(FutureOr<Widget> Function() builder) async {
    
    await runZonedGuarded(
      () async {   
        WidgetsFlutterBinding.ensureInitialized();
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
        runApp(await builder());

      },
      (error, stackTrace) => logger.e('Exception', error, stackTrace),
    );
  }
}

