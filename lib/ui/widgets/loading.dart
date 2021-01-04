import 'package:flutter/material.dart';

abstract class Loading {
  static Widget linear({@required bool isLoading}) =>
      isLoading ? LinearProgressIndicator(minHeight: 4) : SizedBox(height: 4);
}

// Container circularProgress() {
//   return Container(
//     alignment: Alignment.center,
//     padding: EdgeInsets.only(top: 10.0),
//     child: CircularProgressIndicator(
//       valueColor: AlwaysStoppedAnimation(Colors.purple),
//     ),
//   );
// }

// Container linearProgress() {
//   return Container(
//     padding: EdgeInsets.only(bottom: 10.0),
//     child: LinearProgressIndicator(
//       valueColor: AlwaysStoppedAnimation(Colors.purple),
//     ),
//   );
// }
