import 'package:auto_route/auto_route.dart';
import 'package:events/config/constants.dart';
import 'package:events/config/routes/router.gr.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  // TODO: Change notification bar text color (and navbar icon theme)
  //? to match the onPrimary color in this page

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primaryVariant,
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // TODO: Swap with logo or app name
            Text('Register', style: theme.textTheme.headline3),
          ],
        ),
      ),
    );
  }
}
