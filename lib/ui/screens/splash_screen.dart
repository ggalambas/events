import 'package:events/app/auth/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

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
