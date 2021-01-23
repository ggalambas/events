import 'package:events/app/auth/auth_model.dart';
import 'package:events/ui/screens/login_screen.dart';
import 'package:events/ui/screens/splash_screen.dart';
import 'package:events/ui/screens/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthModel>(context);
    final isAuthenticated = auth.isAuthenticated;

    if (isAuthenticated == null) return SplashScreen();
    if (!isAuthenticated) return LoginScreen();

    return VerificationScreen();
  }
}
