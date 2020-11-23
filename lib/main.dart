import 'package:auto_route/auto_route.dart';
import 'package:events/app/scroll_model.dart';
import 'package:events/injection.dart';
import 'package:events/router.gr.dart';
import 'package:events/ui/config/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(MyApp());
}

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CustomTheme>(create: (_) => CustomTheme()),
        ChangeNotifierProvider<ScrollModel>(create: (_) => ScrollModel()),
      ],
      child: Consumer<CustomTheme>(
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
      ),
    );
  }
}
