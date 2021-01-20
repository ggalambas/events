import 'package:events/app/auth/auth_model.dart';
import 'package:events/domain/auth/user.dart';
import 'package:events/providers.dart';
import 'package:events/ui/screens/login_screen.dart';
import 'package:events/ui/screens/regions_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    final isAuthenticated = auth.isAuthenticated;

    if (isAuthenticated != null) {
      return isAuthenticated
          ? MultiProvider(
              providers: userProviders +
                  [Provider<User>.value(value: auth.signedInUser)],
              child: RegionsScreen(),
            )
          : LoginScreen();
    }

    return SplashScreen();
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.surface,
      padding: EdgeInsets.only(bottom: 48), //!
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                height: 72,
                width: 72,
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          Text(
            'App Name'.toUpperCase(),
            style: theme.textTheme.headline1,
          ),
        ],
      ),
    );
  }
}
