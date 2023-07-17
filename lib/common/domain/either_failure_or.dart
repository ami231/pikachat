import 'package:dartz/dartz.dart';
import 'enitities/failure.dart';

typedef EitherFailureOr<T> = Future<Either<Failure, T>>;