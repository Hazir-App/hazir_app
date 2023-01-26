import 'package:equatable/equatable.dart';
import 'package:hazir_app/data/models/course.dart';

class Enrollment extends Equatable{
  final List<Course> courses;
  final String semesterId;
  final DateTime lastUpdated;

  const Enrollment({
    required this.courses,
    required this.semesterId,
    required this.lastUpdated,
  });

  
  @override
  List<Object?> get props => [courses, semesterId, lastUpdated];
}
