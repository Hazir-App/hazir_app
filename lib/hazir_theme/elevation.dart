//define a theme extension ElevationStyle

import 'package:flutter/material.dart';

class Elevation extends ThemeExtension<Elevation> {
  BoxDecoration? style1;

  Elevation({
    this.style1,
  });

  @override
  Elevation copyWith({
    BoxDecoration? style1,
  }) {
    return Elevation(
      style1: style1 ?? this.style1,
    );
  }

  @override
  ThemeExtension<Elevation> lerp(ThemeExtension<Elevation>? other, double t) {
    if (other is! Elevation) {
      return this;
    }
    return Elevation(
      style1: BoxDecoration.lerp(style1, other.style1, t),
    );
  }
}


