import 'package:auto_route/auto_route.dart';
import 'package:events/app/appbar/calendar_model.dart';
import 'package:events/app/appbar/scroll_model.dart';
import 'package:events/app/body/regions_model.dart';
import 'package:events/app/drawer/category_model.dart';
import 'package:events/config/injection.dart';
import 'package:events/config/theme/theme_config.dart';
import 'package:events/config/routes/router.gr.dart' as auto;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.prod);
  await Firebase.initializeApp(); // TODO firebase init
  // https://firebase.flutter.dev/docs/overview#initializing-flutterfire
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
    ThemeConfig.statusBarListener(WidgetsBinding.instance.window);
    initializeDateFormatting('pt_PT');
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeConfig>(create: (_) => ThemeConfig()),
        ChangeNotifierProvider<CategoryModel>.value(
            value: getIt<CategoryModel>()), //TODO: extract selected?
        ChangeNotifierProvider<CalendarModel>(create: (_) => CalendarModel()),
      ],
      child: Consumer<ThemeConfig>(
        builder: (_, theme, __) {
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
      ),
    );
  }
}
