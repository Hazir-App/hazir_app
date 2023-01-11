import 'package:flutter/material.dart';

class HazirAppBar extends AppBar {
  final Widget child;
  HazirAppBar({required this.child, super.key, super.toolbarHeight, super.automaticallyImplyLeading = false, super.title})
      : super(
          flexibleSpace: child,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(12),
            ),
          ),
        );
}
