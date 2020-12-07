import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SafeArea(
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
