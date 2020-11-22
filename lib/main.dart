import 'package:auto_route/auto_route.dart';
import 'package:events/app/custom_theme.dart';
import 'package:events/ui/components/base_widget.dart';
import 'package:events/ui/config/router.gr.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    // FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    return BaseWidget<CustomTheme>(
      model: CustomTheme(),
      builder: (_, theme, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false, //!
          theme: theme.light,
          darkTheme: theme.dark,
          themeMode: theme.mode,
          builder: ExtendedNavigator.builder<ARouter>(
            router: ARouter(),
            name: 'router',
          ),
        );
      },
    );
  }
}
