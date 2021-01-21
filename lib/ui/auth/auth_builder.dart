import 'package:events/app/auth/auth_model.dart';
import 'package:events/domain/auth/user.dart';
import 'package:events/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthBuilder extends StatelessWidget {
  final Widget child;
  const AuthBuilder({@required this.child});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    final isAuthenticated = auth.isAuthenticated;

    if (isAuthenticated ?? false) {
      return MultiProvider(
        providers:
            userProviders + [Provider<User>.value(value: auth.signedInUser)],
        child: child,
      );
    }

    return child;
  }
}
