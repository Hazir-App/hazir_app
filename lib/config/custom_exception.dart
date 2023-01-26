import 'package:equatable/equatable.dart';

abstract class CustomException extends Equatable implements Exception {
  final String? statusCode;
  final String? message;
  final StackTrace? stackTrace;

  CustomException({String? message, this.statusCode, this.stackTrace}) : message = _parseExceptionMessage(message);

  static String? _parseExceptionMessage(String? message) {
    String tempMessage = message ?? '';
    if (message != null) {
      List<String> stopWords = ['exception:', 'error:', 'supabase', 'socket', 'microsoft.com', 'response'];
      for (String word in stopWords) {
        if (tempMessage.contains(word)) {
          return null;
        }
      }
      return message;
    }
    return null;
  }

  @override
  List<Object> get props => [];

  @override
  String toString() => '$runtimeType Exception';
}
