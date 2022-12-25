import 'package:movies/core/network/erroe_messege_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  ServerException({required this.errorMessageModel});
}

class LocalDatabaseException implements Exception {
  final String message;

  LocalDatabaseException({required this.message});
}
