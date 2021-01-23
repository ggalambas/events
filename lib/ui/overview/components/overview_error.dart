import 'package:dartz/dartz.dart';
import 'package:events/domain/core/repository_failure.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

//TODO
//* refactorize this and sign_in_error

void showError(
  BuildContext context,
  Option<Either<RepositoryFailure, Unit>> prefsFailureOrSuccessOption,
) {
  prefsFailureOrSuccessOption.fold(
    () => null,
    (failureOrSuccess) => failureOrSuccess.fold(
      (failure) => SchedulerBinding.instance.addPostFrameCallback((_) {
        final ThemeData theme = Theme.of(context);
        Flushbar(
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
            'Ocorreu um erro, tente novamente mais tarde',
            style: theme.textTheme.bodyText1.copyWith(
              color: theme.colorScheme.onError,
            ),
          ),
        ).show(context);
      }),
      (_) => null,
    ),
  );
}
