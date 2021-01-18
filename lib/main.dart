import 'package:auto_route/auto_route.dart';
import 'package:events/app/appbar/calendar_model.dart';
import 'package:events/app/auth/auth_model.dart';
import 'package:events/app/auth/sign_in_form_model.dart';
import 'package:events/app/drawer/category_model.dart';
import 'package:events/config/injection.dart';
import 'package:events/config/theme/theme_config.dart';
import 'package:events/config/routes/router.gr.dart' as auto;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection(Environment.prod);
  await Firebase.initializeApp();
  // Firebase security rules -> https://firebase.google.com/docs/rules/basics
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // IOS orientation setup -> https://greymag.medium.com/flutter-orientation-lock-portrait-only-c98910ebd769
  runApp(MyApp());
}

//TODO
//* 1. icon
//* 2. splash screen
// splash screen -> https://flutter.dev/docs/development/ui/advanced/splash-screen
//* 3. getOrCrash();
//* 4. hero animations

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('pt_PT');
    WidgetsBinding.instance.addObserver(this);
    ThemeConfig.statusBarListener(WidgetsBinding.instance.window);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      ThemeConfig.statusBarListener(WidgetsBinding.instance.window);
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      builder: (context, _) {
        final ThemeConfig theme = Provider.of<ThemeConfig>(context);
        final AuthModel auth = Provider.of<AuthModel>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false, //!
          title: 'Events', //!
          theme: theme.light,
          darkTheme: theme.dark,
          themeMode: theme.mode,
          builder: ExtendedNavigator.builder<auto.Router>(
            router: auto.Router(),
            initialRoute: auth.isAuthenticated
                ? auto.Routes.regionsScreen
                : auto.Routes.loginScreen,
          ),
        );
      },
    );
  }
}

List<SingleChildWidget> providers = [
  ChangeNotifierProvider<AuthModel>.value(
    value: getIt<AuthModel>(),
  ),
  ChangeNotifierProvider<ThemeConfig>(
    create: (_) => ThemeConfig(),
  ),
  ChangeNotifierProvider<CalendarModel>.value(
    value: getIt<CalendarModel>(),
  ),
  ChangeNotifierProvider<CategoryModel>.value(
    value: getIt<CategoryModel>(),
  ),
  ChangeNotifierProvider<SignInFormModel>.value(
    value: getIt<SignInFormModel>(),
  ),
];
