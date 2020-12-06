import 'package:auto_route/auto_route.dart';
import 'package:events/config/routes/router.gr.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
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
          ExtendedNavigator.root.replace(Routes.regionsView);
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Container(
          color: theme.colorScheme.surface,
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //     colors: [
          //       theme.colorScheme.primary,
          //       theme.colorScheme.primaryVariant,
          //     ],
          //   ),
          // ),
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
      },
    );
  }
}
