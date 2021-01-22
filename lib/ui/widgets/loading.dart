import 'package:flutter/material.dart';

abstract class Loading {
  static Widget linear({@required bool isLoading}) =>
      isLoading ? LinearProgressIndicator(minHeight: 4) : SizedBox(height: 4);

  static Widget circular() => Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );
}
