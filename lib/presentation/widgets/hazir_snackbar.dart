
import 'package:flutter/material.dart';

class HazirSnackbar extends SnackBar {
  HazirSnackbar({required String message, super.backgroundColor, super.key}) : super(content: Text(message));
}
