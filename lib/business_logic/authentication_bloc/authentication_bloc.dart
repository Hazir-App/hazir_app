import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hazir_app/data/models/user.dart';
import 'package:hazir_app/data/repositories/auth_repository/auth_repository.dart';
import 'package:hazir_app/data/repositories/user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  late StreamSubscription<AuthStatus> _authenticationStatusSubscription;

  AuthenticationBloc({
    required AuthRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const AuthenticationState.unknown()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);

    _authenticationStatusSubscription = _authRepository.status.listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );
  }

  @override
  Future<void> close() {
    _authenticationStatusSubscription.cancel();
    _authRepository.dispose();
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
    _authRepository.signOut();
  }

  Future<User?> _tryGetUser() async {
    await _userRepository.getCurrentUserData();
    return _userRepository.currentUser;
  }
}
