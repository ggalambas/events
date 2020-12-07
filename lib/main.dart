import 'package:auto_route/auto_route.dart';
import 'package:events/app/appbar/calendar_model.dart';
import 'package:events/config/theme/theme_config.dart';
import 'package:events/config/routes/router.gr.dart' as auto;
import 'package:events/ui/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<void> main() async {
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

  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeConfig>(
      create: (_) => ThemeConfig(),
      builder: (context, _) {
        final ThemeConfig theme = Provider.of<ThemeConfig>(context);
        return FutureBuilder(
          // Initialize FlutterFire:
          future: _initialization,
          builder: (context, snapshot) {
            // Check for errors
            if (snapshot.hasError) {
              //TODO: return SomethingWentWrong();
            }

            // Once complete, show your application
            if (snapshot.connectionState == ConnectionState.done) {
              configureInjection(Environment.prod);
              return MultiProvider(
                providers: providers,
                child: MaterialApp(
                  debugShowCheckedModeBanner: false, //!
                  theme: theme.light,
                  darkTheme: theme.dark,
                  themeMode: theme.mode,
                  builder: ExtendedNavigator.builder<auto.Router>(
                    router: auto.Router(),
                  ),
                ),
              );
            }

            // Otherwise, show something whilst waiting for initialization to complete
            //TODO: splash screen
            return MaterialApp(
              theme: theme.light,
              darkTheme: theme.dark,
              themeMode: theme.mode,
              home: SplashScreen(),
            );
          },
        );
      },
    );
  }
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<CalendarModel>.value(value: getIt<CalendarModel>()),
  ChangeNotifierProvider<CategoryModel>.value(value: getIt<CategoryModel>()),
];
