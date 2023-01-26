import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hazir_app/data/models/enrollment.dart';
import 'package:hazir_app/data/models/user.dart';
import 'package:hazir_app/data/repositories/enrollment_repository/enrollment_repository.dart';
import 'package:hazir_app/data/repositories/user_repository/user_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository _userRepository;
  final EnrollmentRepository _enrollmentRepository;

  HomeBloc({required EnrollmentRepository enrollmentRepository, required UserRepository userRepository})
      : _userRepository = userRepository,
        _enrollmentRepository = enrollmentRepository,
        super(HomeStateLoading(user: userRepository.currentUser)) {
    on<HomeGet>(_onHomeGet);
  }

  void _onHomeGet(HomeGet event, Emitter<HomeState> emit) async {
    try{
    emit(HomeStateLoading(user: _userRepository.currentUser));
    await _enrollmentRepository.getEnrollment(_userRepository.currentUser, '2311');
    emit(HomeStateLoaded(user: _userRepository.currentUser, enrollment: _enrollmentRepository.enrollment!));
    }catch(e){
      emit(HomeStateError(user: _userRepository.currentUser, errorMessage: e.toString()));
    }
  }
}
