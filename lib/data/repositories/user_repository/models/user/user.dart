import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String studentId;

  const User({required this.studentId, required this.name});

  static const empty = User(name: '-', studentId: '-');

  @override
  List<Object> get props => [name, studentId];
}
