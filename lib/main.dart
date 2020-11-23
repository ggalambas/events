import 'package:auto_route/auto_route.dart';
import 'package:events/app/custom_theme.dart';
import 'package:events/ui/components/base_widget.dart';
import 'package:events/ui/config/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    final window = WidgetsBinding.instance.window;
    CustomTheme.statusBarListener(window);

    initializeDateFormatting('pt_PT');
  }

  @override
  Widget build(BuildContext context) {
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
          ),
        );
      },
    );
  }
}
