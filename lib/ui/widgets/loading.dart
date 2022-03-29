import 'package:flutter/material.dart';

mixin Loading {
  static Widget linear({@required bool isLoading}) => isLoading
      ? const LinearProgressIndicator(minHeight: 4)
      : const SizedBox(height: 4);

  static Widget circular() => Container(
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      );
}
