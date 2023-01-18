import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hazir_app/data/repositories/user_repository/models/user/user.dart';
import 'package:hazir_app/data/repositories/user_repository/user_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserRepository _userRepository;

  HomeBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(HomeState.loading(user: userRepository.currentUser)) {
    on<HomeGet>(_onHomeGet);
  }

  void _onHomeGet(HomeGet event, Emitter<HomeState> emit) async {
    emit(HomeState.loading(user: _userRepository.currentUser));
    await Future.delayed(const Duration(seconds: 2));
    emit(HomeState.loaded(user: _userRepository.currentUser));
  }
}
