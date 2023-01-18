import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hazir_app/business_logic/authentication_bloc/authentication_bloc.dart';
import 'package:hazir_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:hazir_app/data/repositories/auth_repository/firebase_auth_repository.dart';
import 'package:hazir_app/data/repositories/user_repository/firebase_user_repository.dart';
import 'package:hazir_app/data/repositories/user_repository/user_repository.dart';
import 'package:hazir_app/presentation/theme/hazir_theme.dart';
import 'package:hazir_app/routes/routes.dart';
import 'package:hazir_app/services/routing_service.dart';
import 'package:hazir_app/services/service_provider.dart';
import 'package:hazir_app/services/snackbar_service.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiServiceProvider(
      providers: [
        ServiceProvider<RoutingService>(create: (context) => RoutingService(routes: routes)),
        ServiceProvider<SnackbarService>(create: (context) => SnackbarService(routingService: context.read<RoutingService>())),
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthRepository>(create: (context) => FirebaseAuthRepository()),
          RepositoryProvider<UserRepository>(create: (context) => FirebaseUserRepository()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => AuthenticationBloc(authenticationRepository: context.read<AuthRepository>(), userRepository: context.read<UserRepository>(),
                    )),
          ],
          child: const AppView(),
        ),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        context.read<RoutingService>().handleAuthenticationRouting(state.status);
      },
      child: MaterialApp(
        theme: HazirTheme.instance.getTheme(context, isLight: true),
        darkTheme: HazirTheme.instance.getTheme(context, isLight: false),
        debugShowCheckedModeBanner: false,
        routes: context.read<RoutingService>().routes,
        initialRoute: context.read<RoutingService>().initialRoute,
        navigatorKey: context.read<RoutingService>().navigatorKey,
      ),
    );
  }
}
