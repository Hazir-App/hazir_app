part of 'home_bloc.dart';


abstract class HomeState extends Equatable {
  final User user;
  const HomeState({required this.user});

  @override
  List<Object?> get props => [user];
}

class HomeStateLoading extends HomeState {
  const HomeStateLoading({required super.user});
}

class HomeStateLoaded extends HomeState {
  final Enrollment enrollment;
  const HomeStateLoaded({required super.user, required this.enrollment});
}

class HomeStateError extends HomeState {
  final String errorMessage;
    final Enrollment? enrollment;
  const HomeStateError({required super.user, required this.errorMessage, this.enrollment});
}

class HomeStateRefresh extends HomeState {
  final Enrollment enrollment;
  const HomeStateRefresh({required super.user, required this.enrollment});
}

