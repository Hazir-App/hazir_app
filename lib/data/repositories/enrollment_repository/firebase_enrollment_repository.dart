import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hazir_app/config/logger.dart';
import 'package:hazir_app/data/models/enrollment.dart';
import 'package:hazir_app/data/models/user.dart';
import 'package:hazir_app/data/repositories/enrollment_repository/dto/firebase_enrollment_dto.dart';
import 'package:hazir_app/data/repositories/enrollment_repository/enrollment_repository.dart';
import 'package:http/http.dart' as http;


class FirebaseEnrollmentRepository implements EnrollmentRepository {
  final FirebaseDatabase db;
  FirebaseEnrollmentRepository() : db = FirebaseDatabase.instanceFor(app: Firebase.app('hazirapp'), databaseURL: 'https://hazir-dev.firebaseio.com/');
  Enrollment? _enrollment;
  @override
  Enrollment? get enrollment => _enrollment;

  @override
  Future<void> getEnrollment(User user, String semesterCode) async {
    final ref = db.ref("$semesterCode/${user.studentNumber}");
    final DataSnapshot snapshot = await ref.get();
    logger.i(snapshot.value);
    if (!snapshot.exists) {
      logger.e("FirebaseEnrollmentRepository: getEnrollment: data is null");
      return;
    }
    Map<String, dynamic> t = Map<String, dynamic>.from((snapshot.value as Map));
    logger.i("test: $t");
    _enrollment = FirebaseEnrollmentDTO(t, semesterId: semesterCode).convert();
    return;
  }
  
  @override
  Future<void> refresh(User user, String semesterCode) async {
    final res = await  http.post(Uri.parse("https://hazir-db-api.herokuapp.com/get/student/${user.studentNumber}"),body: {"authkey":"12345"});
    if(res.statusCode==200){
      getEnrollment(user, semesterCode);
    }else{
      throw Exception();
    }
    return;
  }
}
