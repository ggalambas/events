import 'package:auto_route/auto_route.dart';
import 'package:events/app/appbar/calendar_model.dart';
import 'package:events/config/injection.dart';
import 'package:events/config/theme/theme_config.dart';
import 'package:events/config/routes/router.gr.dart' as auto;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'app/drawer/category_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.prod);
  await Firebase.initializeApp();
  runApp(MyApp());
}

//TODO
//* 1. icon
//* 2. splash screen
// splash screen -> https://flutter.dev/docs/development/ui/advanced/splash-screen
//* 3. getOrCrash();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    ThemeConfig.statusBarListener(WidgetsBinding.instance.window);
    initializeDateFormatting('pt_PT');
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      builder: (context, _) {
        final ThemeConfig theme = Provider.of<ThemeConfig>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false, //!
          theme: theme.light,
          darkTheme: theme.dark,
          themeMode: theme.mode,
          builder: ExtendedNavigator.builder<auto.Router>(
            router: auto.Router(),
          ),
        );
      },
    );
  }
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<ThemeConfig>(create: (_) => ThemeConfig()),
  ChangeNotifierProvider<CalendarModel>.value(value: getIt<CalendarModel>()),
  ChangeNotifierProvider<CategoryModel>.value(value: getIt<CategoryModel>()),
];
