import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const ShimmerEffect({super.key, required this.isLoading, required this.child});

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return child;
    }
    return Shimmer(
      child: child,
      gradient: const LinearGradient(
        colors: [
          Color(0xFFEBEBF4),
          Color(0xFFF4F4F4),
          Color(0xFFEBEBF4),
        ],
        stops: [
          0.1,
          0.3,
          0.4,
        ],
        begin: Alignment(-1.0, -0.3),
        end: Alignment(1.0, 0.3),
        tileMode: TileMode.clamp,
      ),
    );
  }
}
