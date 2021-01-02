import 'package:dartz/dartz.dart';
import 'package:events/domain/auth/auth_failure.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void showError(
  BuildContext context,
  Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  void Function() success,
) {
  authFailureOrSuccessOption.fold(
    () => null,
    (failureOrSuccess) => failureOrSuccess.fold(
      (failure) => SchedulerBinding.instance
          .addPostFrameCallback((_) => FlushbarHelper.createError(
                message: failure.map(
                  serverError: (_) => 'Ocorreu um erro',
                  emailAlreadyInUse: (_) =>
                      'Já existe uma conta com este email associado',
                  invalidEmailAndPasswordCombination: (_) =>
                      'Password incorreta',
                ),
              ).show(context)),
      (_) => success(),
    ),
  );
}
