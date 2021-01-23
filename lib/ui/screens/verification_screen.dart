import 'package:events/ui/screens/overview_screen.dart';
import 'package:flutter/material.dart';

class VerificationScreen extends StatelessWidget {
  //TODO email verification
  /**STEPS
   * * check if user is verified
   * * IF NOT
   * * send email verification
   * * UI
   * *  use the code sent to your email to verify your account 
   * *  inputs for code
   * *  didnt receive a verification email? send again
   * *   or
   * *  sending again in x seconds
   * 
   * * IF VERIFIED
   */

  @override
  Widget build(BuildContext context) {
    // if verified
    return OverviewScreen();
  }
}
