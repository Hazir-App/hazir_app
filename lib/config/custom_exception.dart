import 'package:equatable/equatable.dart';

abstract class CustomException extends Equatable implements Exception {
  final String? statusCode;
  final String? message;

  CustomException({String? message, this.statusCode}) : message = _parseExceptionMessage(message);

  static String? _parseExceptionMessage(String? message) {
    if (message != null) {
      String tempMessage = message.toLowerCase();
      List<String> stopWords = ['exception:', 'error:', 'supabase', 'socket'];
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
