part of 'home_bloc.dart';

enum HomeScreenStatus {
  loading,
  loaded,
  refreshing,
  error,
}

class HomeState extends Equatable {
  final HomeScreenStatus status;
  final User user;
  final String? errorMessage;

  const HomeState._({this.status = HomeScreenStatus.loading, this.user = User.empty, this.errorMessage});

  const HomeState.loading({required User user}) : this._(status: HomeScreenStatus.loading, user: user);
  const HomeState.loaded({required User user}) : this._(status: HomeScreenStatus.loaded, user: user);
  const HomeState.refresh({required User user}) : this._(status: HomeScreenStatus.refreshing, user: user);
  const HomeState.error({required User user, String? errorMessage}) : this._(status: HomeScreenStatus.error, user: user, errorMessage: errorMessage);


  @override
  List<Object?> get props => [status,user,errorMessage];
}
