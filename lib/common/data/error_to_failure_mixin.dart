import 'package:flutter/material.dart';
import 'package:dartz/dartz.dart';

import '../domain/either_failure_or.dart';
import '../domain/enitities/failure.dart';

mixin ErrorToFailureMixin {
  EitherFailureOr<T> execute<T>(
    EitherFailureOr<T> Function() function, {
    Failure? failure,
    EitherFailureOr<T> Function(Object err)? onError,
  }) async {
    try {
      return await function();
    } catch (err) {
      debugPrint(err.toString());

      if (onError != null) {
        return onError(err);
      }
      return const Left(
        Failure.serverError(),
      );
    }
  }
}