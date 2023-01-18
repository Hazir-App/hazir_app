import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hazir_app/data/exceptions/auth_exception.dart';
import 'package:hazir_app/data/repositories/auth_repository/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;

  LoginBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginInitial()) {
    on<LoginWithMicrosoft>(_onLoginWithMicrosoft);
  }

  Future<void> _onLoginWithMicrosoft(LoginWithMicrosoft event, Emitter<LoginState> emit) async {
    try {
      emit(LoginLoading());
      await _authRepository.signInWithMicrosoft();
      emit(LoginInitial());
    } on AuthException catch (e) {
      emit(LoginError(errorMessage: e.message));
    }
  }
}
