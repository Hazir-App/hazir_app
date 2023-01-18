import 'package:flutter/material.dart';
import 'package:hazir_app/config/constants.dart';
import 'package:hazir_app/presentation/widgets/hazir_snackbar.dart';
import 'package:hazir_app/services/routing_service.dart';

class SnackbarService {
  final RoutingService _routingService;

  SnackbarService({required RoutingService routingService}) : _routingService = routingService;

  showError({String? message}) {
    ScaffoldMessenger.of(_routingService.navigatorKey.currentState!.context)
        .showSnackBar(HazirSnackbar(message: message ?? kGenericErrorMessage, backgroundColor: Theme.of(_routingService.navigatorKey.currentState!.context).errorColor));
  }
}
