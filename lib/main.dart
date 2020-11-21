import 'package:events/app/customTheme.dart';
import 'package:events/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    // FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    return ChangeNotifierProvider<CustomTheme>(
      create: (_) => CustomTheme(),
      child: Consumer<CustomTheme>(
        builder: (_, theme, __) {
          return MaterialApp(
            theme: theme.light,
            darkTheme: theme.dark,
            themeMode: theme.mode,
            home: Home(),
          );
        },
      ),
    );
  }
}
