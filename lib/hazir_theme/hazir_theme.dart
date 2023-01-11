library hazir_theme;

import 'package:flutter/material.dart';
import 'package:hazir_app/hazir_theme/elevation.dart';

class HazirTheme {
  HazirTheme._();
  static final HazirTheme instance = HazirTheme._();

  final _lightColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF83468F),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFFED6FF),
    onPrimaryContainer: Color(0xFF340041),
    secondary: Color(0xFF705D00),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFFFE16D),
    onSecondaryContainer: Color(0xFF221B00),
    tertiary: Color(0xFF7C5800),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFFDEA7),
    onTertiaryContainer: Color(0xFF271900),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFF6FEFF),
    onBackground: Color(0xFF001F24),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF001F24),
    surfaceVariant: Color(0xFFECDFE9),
    onSurfaceVariant: Color(0xFF4D444C),
    outline: Color(0xFF7E747D),
    onInverseSurface: Color(0xFFD0F8FF),
    inverseSurface: Color(0xFF00363D),
    inversePrimary: Color(0xFFF5AEFF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF83468F),
  );

  final _darkColorScheme = const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFF5AEFF),
    onPrimary: Color(0xFF4F155D),
    primaryContainer: Color(0xFF692E75),
    onPrimaryContainer: Color(0xFFFED6FF),
    secondary: Color(0xFFE3C54A),
    onSecondary: Color(0xFF3A3000),
    secondaryContainer: Color(0xFF544600),
    onSecondaryContainer: Color(0xFFFFE16D),
    tertiary: Color(0xFFFFBA1E),
    onTertiary: Color(0xFF412D00),
    tertiaryContainer: Color(0xFF5E4200),
    onTertiaryContainer: Color(0xFFFFDEA7),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF001F24),
    onBackground: Color(0xFF97F0FF),
    surface: Color(0xFF001F24),
    onSurface: Color(0xFF97F0FF),
    surfaceVariant: Color(0xFF4D444C),
    onSurfaceVariant: Color(0xFFCFC3CD),
    outline: Color(0xFF988D97),
    onInverseSurface: Color(0xFF001F24),
    inverseSurface: Color(0xFF97F0FF),
    inversePrimary: Color(0xFF83468F),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFF5AEFF),
  );

  ColorScheme _getColorScheme({required bool isLight}) => isLight ? _lightColorScheme : _darkColorScheme;

  AppBarTheme _getAppBarTheme(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return Theme.of(context).appBarTheme.copyWith(
        titleSpacing: 0,
        elevation: 4,
        shadowColor: _getColorScheme(isLight: isLight).shadow,
        centerTitle: false,
        color: _getColorScheme(isLight: isLight).primary,
        foregroundColor: _getColorScheme(isLight: isLight).onPrimary,
        iconTheme: IconThemeData(color: _getColorScheme(isLight: isLight).onPrimary));
  }

  List<ThemeExtension<dynamic>> _getThemeExtensions(BuildContext context) {
    final isLight = Theme.of(context).brightness == Brightness.light;
    return [
      Elevation(
        style1: BoxDecoration(
          color: _getColorScheme(isLight: isLight).surface,
          boxShadow: [
            BoxShadow(color: _getColorScheme(isLight: isLight).onBackground.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, 4)),
          ],
        ),
      ),
    ];
  }

  ThemeData getTheme(BuildContext context, {required isLight}) => ThemeData(
        useMaterial3: true,
        colorScheme: _getColorScheme(isLight: isLight),
        appBarTheme: _getAppBarTheme(context),
        extensions: _getThemeExtensions(context),
      );
}
