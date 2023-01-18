import 'package:hazir_app/config/custom_exception.dart';

class UserException extends CustomException {
  UserException({super.message, super.statusCode});
}
