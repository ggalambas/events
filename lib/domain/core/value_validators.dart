import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:events/domain/core/failures.dart';
import 'package:string_validator/string_validator.dart';

//TODO
//* 1. UrlValidation
//* 2. ImageValidation
//* 3. Image Dimensions validation
//* 4. Auth validators

Either<ValueFailure<String>, String> validateMaxStringLength(
  String input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
      ValueFailure.exceedingLength(failedValue: input, max: maxLength),
    );
  }
}

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueFailure.empty(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateSingleLine(String input) {
  if (input.contains('\n')) {
    return left(ValueFailure.multiline(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validateUrl(String input) {
  //! 1
  if (isURL(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidUrl(failedValue: input));
  }
}

Either<ValueFailure<File>, File> validateImage(File input) {
  //! 2
  if (true) {
    return right(input);
  } else {
    return left(ValueFailure.wrongFileFormat(failedValue: input));
  }
}

Either<ValueFailure<File>, File> validateDimensions(File input) {
  //! 3
  if (true) {
    return right(input);
  } else {
    return left(ValueFailure.wrongImageDimensions(failedValue: input));
  }
}

//! 4
// Either<ValueFailure<String>, String> validateEmailAddress(String input) {
//   const emailRegex =
//       r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
//   if (RegExp(emailRegex).hasMatch(input)) {
//     return right(input);
//   } else {
//     return left(ValueFailure.invalidEmail(failedValue: input));
//   }
// }

// Either<ValueFailure<String>, String> validatePassword(String input) {
//   if (input.length >= 6) {
//     return right(input);
//   } else {
//     return left(ValueFailure.shortPassword(failedValue: input));
//   }
// }
