import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:events/app/auth/sign_in_form_model.dart';
import 'package:events/config/constants.dart';
import 'package:events/config/routes/router.gr.dart';
import 'package:events/domain/auth/auth_failure.dart';
import 'package:events/ui/auth/components/input_field.dart';
import 'package:events/ui/auth/components/sign_in_error.dart';
import 'package:events/ui/auth/components/submit_button.dart';
import 'package:events/ui/auth/sign_in_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  void _showError(
    BuildContext context,
    Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  ) =>
      showError(
        context,
        authFailureOrSuccessOption,
        () {
          Navigator.pop(context);
          ExtendedNavigator.root.replace(Routes.regionsScreen);
        },
      );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final SignInFormModel signInForm = Provider.of<SignInFormModel>(context);
    return SignInScaffold(
      ableToGoBack: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Text(
            'Cria a tua\nconta!',
            style: theme.textTheme.headline3,
          ),
          Spacer(),
          InputField(
            hintText: 'Nome',
            keyboardType: TextInputType.name,
            onChanged: signInForm.nameChanged,
            textInputAction: TextInputAction.next,
          ),
          InputField(
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            onChanged: signInForm.emailChanged,
            validator: (_) => signInForm.emailValidated(
              invalidEmail: 'Invalid Email',
            ),
            textInputAction: TextInputAction.next,
          ),
          InputField(
            hintText: 'Palavra passe',
            obscureText: true,
            onChanged: signInForm.passwordChanged,
            validator: (_) => signInForm.passwordValidated(
              shortPassword: 'Short Password',
            ),
            textInputAction: TextInputAction.done,
          ),
          SubmitButton(
            text: 'Registar',
            onPressed: () async {
              await signInForm.registerWithEmailAndPassword();
              _showError(context, signInForm.authFailureOrSuccessOption);
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kFormCaptionPadding),
            child: Text(
              'Ao criar uma conta está a aceitar os nossos Termos e Condições',
              style: theme.textTheme.caption,
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
