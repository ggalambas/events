import 'package:auto_route/auto_route.dart';
import 'package:events/config/routes/router.gr.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    ExtendedNavigator.root.replace(Routes.regionsView);
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('A TUA PRIMA'));
  }
}
