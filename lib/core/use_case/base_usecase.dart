import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failier.dart';

abstract class BaseUseCase<T, Parameter> {
  Future<Either<Failer, T>> call(Parameter parameter);
}

class NoParameter extends Equatable {
  const NoParameter();

  @override
  List<Object?> get props => [];
}
