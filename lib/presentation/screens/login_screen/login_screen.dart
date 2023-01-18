import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hazir_app/business_logic/login_bloc/login_bloc.dart';
import 'package:hazir_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:hazir_app/presentation/widgets/hazir_buttons/hazir_buttons.dart';
import 'package:hazir_app/services/snackbar_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static String get route => "/login";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(
        authRepository: context.read<AuthRepository>(),
      ),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginError) {
            context.read<SnackbarService>().showError(message: state.errorMessage);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.5,
                    child: HazirOutlinedButton(
                      leading: Image.asset("assets/images/microsoft-logo.png", scale: 1.2),
                      isLoading: state is LoginLoading,
                      onPressed: () async => context.read<LoginBloc>().add(LoginWithMicrosoft()),
                      buttonText: "Login With Microsoft",
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
