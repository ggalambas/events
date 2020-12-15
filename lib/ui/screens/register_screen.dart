import 'package:auto_route/auto_route.dart';
import 'package:events/config/constants.dart';
import 'package:events/config/routes/router.gr.dart';
import 'package:events/ui/auth/components/alt_sign_in_button.dart';
import 'package:events/ui/auth/components/input_field.dart';
import 'package:events/ui/auth/components/submit_button.dart';
import 'package:events/ui/widgets/swipe_up.dart';
import 'package:flutter/material.dart';

//TODO
//* 1. Auth

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      backgroundColor: theme.colorScheme.surface,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: kFormHorizPadding),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InputField(
                  hintText: 'Nome',
                ),
                InputField(
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                ),
                InputField(
                  hintText: 'Password',
                  obscureText: true,
                ),
                SubmitButton(
                  text: 'Registar',
                  onPressed: () => ExtendedNavigator.root
                      .replace(Routes.regionsScreen), //! 1
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kFormCaptionPadding),
                  child: Text(
                    'Ao criar uma conta está a aceitar os nossos Termos e Condições',
                    style: theme.textTheme.caption,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
