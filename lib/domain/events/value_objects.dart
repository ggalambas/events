import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:events/domain/core/value_failures.dart';
import 'package:events/domain/core/value_objects.dart';
import 'package:events/domain/core/value_validators.dart';

//TODO
//* 1. max length
//* 2. advised length

class EventName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const advisedLength = 30; //! 2
  static const maxLength = 50; //! 1

  factory EventName(String input) {
    assert(input != null);
    return EventName._(
      validateMaxStringLength(input, maxLength)
          .flatMap(validateStringNotEmpty)
          .flatMap(validateSingleLine),
    );
  }

  const EventName._(this.value);
}

class EventLink extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EventLink(String input) {
    assert(input != null);
    return EventLink._(validateUrl(input));
  }

  const EventLink._(this.value);
}

class Poster extends ValueObject<File> {
  @override
  final Either<ValueFailure<File>, File> value;

  factory Poster(File input) {
    assert(input != null);
    return Poster._(validateImage(input).flatMap(validateDimensions));
  }

  const Poster._(this.value);
}
