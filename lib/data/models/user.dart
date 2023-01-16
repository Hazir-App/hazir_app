import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? firstName;
  final String? studentId;

  const User({this.firstName, this.studentId});
  static const empty = User();
  
  
  @override
  List<Object?> get props => [firstName, studentId];
}
