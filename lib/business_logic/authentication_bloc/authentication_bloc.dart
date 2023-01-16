import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hazir_app/data/enums/auth_status.dart';
import 'package:hazir_app/data/models/user.dart';
import 'package:hazir_app/data/repositories/auth_repository/auth_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository _authenticationRepository;
  late StreamSubscription<AuthStatus> _authenticationStatusSubscription;

  AuthenticationBloc({
    required AuthRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.unknown()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);

    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }

  void _onAuthenticationStatusChanged(
    AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    switch (event.status) {
      case AuthStatus.unauthenticated:
        return emit(const AuthenticationState.unauthenticated());
      case AuthStatus.authenticated:
        final user = await _tryGetUser();
        return emit(user != null ? AuthenticationState.authenticated(user) : const AuthenticationState.unauthenticated());
      default:
        return emit(const AuthenticationState.unknown());
    }
  }

  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    _authenticationRepository.signOut();
  }

  Future<User?> _tryGetUser() async {
    await Future.delayed(const Duration(seconds: 1));
    return const User(firstName: "Abuzar", studentId: "ar06194");
  }
}
