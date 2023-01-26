import 'package:hazir_app/config/custom_exception.dart';

class AuthException extends CustomException{  
  AuthException({super.message, super.statusCode,  super.stackTrace});
}