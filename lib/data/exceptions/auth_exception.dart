import 'package:hazir_app/data/exceptions/custom_exception.dart';

class AuthException extends CustomException{  
  AuthException({super.message, super.statusCode});
}