import 'package:equatable/equatable.dart';

abstract class Failer extends Equatable {
  final String message;

  const Failer(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailer extends Failer {
  const ServerFailer(super.message);
}

class DatabaseFailer extends Failer {
  const DatabaseFailer(super.message);
}
