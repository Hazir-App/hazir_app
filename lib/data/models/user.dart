import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String name;
  final String studentId;


  const User({required this.studentId, required this.name});


  String get studentNumber => int.parse(studentId.replaceAll(RegExp(r'[^0-9]'), '')).toString().padLeft(5,'0');

  static const empty = User(name: '-', studentId: '-');

  @override
  List<Object> get props => [name, studentId];
}
