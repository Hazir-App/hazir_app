import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
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
        FirebaseUIAuth.configureProviders([
          EmailLinkAuthProvider(
            actionCodeSettings: ActionCodeSettings(
              url: 'https://hazirapp.page.link/',
              handleCodeInApp: true,
              androidMinimumVersion: '1',
              androidPackageName: 'com.habib.hazir_app',
              iOSBundleId: 'com.habib.hazirApp',
              androidInstallApp: true
            ),
          ),
        ]);
        runApp(await builder());

      },
      (error, stackTrace) => logger.e('Exception', error, stackTrace),
    );
  }
}

