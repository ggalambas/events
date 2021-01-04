import 'package:dartz/dartz.dart';
import 'package:events/domain/auth/auth_failure.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void showError(
  BuildContext context,
  Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  void Function() success,
) {
  ThemeData theme = Theme.of(context);
  authFailureOrSuccessOption.fold(
    () => null,
    (failureOrSuccess) => failureOrSuccess.fold(
      (failure) =>
          SchedulerBinding.instance.addPostFrameCallback((_) => Flushbar(
                icon: Icon(
                  Icons.warning,
                  color: theme.colorScheme.onError,
                ),
                shouldIconPulse: false,
                backgroundColor: theme.colorScheme.error,
                flushbarPosition: FlushbarPosition.TOP,
                flushbarStyle: FlushbarStyle.GROUNDED,
                duration: Duration(seconds: 5),
                messageText: Text(
                  failure.map(
                    serverError: (_) => 'Ocorreu um erro',
                    emailAlreadyInUse: (_) =>
                        'Já existe uma conta com este email associado',
                    invalidEmailAndPasswordCombination: (_) =>
                        'Password incorreta',
                  ),
                  style: theme.textTheme.bodyText1.copyWith(
                    color: theme.colorScheme.onError,
                  ),
                ),
              ).show(context)),
      (_) => success(),
    ),
  );
}
