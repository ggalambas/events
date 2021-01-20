import 'package:events/app/auth/sign_in_form_model.dart';
import 'package:events/config/constants.dart';
import 'package:events/ui/auth/components/input_field.dart';
import 'package:events/ui/auth/components/sign_in_error.dart';
import 'package:events/ui/auth/components/submit_button.dart';
import 'package:events/ui/auth/sign_in_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  // TODO
  //* its scrolling wtf?
  //* review Terms and Conditions

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
              showError(context, signInForm.authFailureOrSuccessOption);
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kFormCaptionPadding),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Ao criar uma conta está a aceitar os nossos ',
                    style: theme.textTheme.caption,
                  ),
                  WidgetSpan(
                    child: GestureDetector(
                      onTap: () => _launch(
                          'https://www.livesport.eu/terms/flashscore_com/'), //! wrong url
                      child: Text(
                        'Termos e Condições',
                        style: theme.textTheme.caption
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            // child: Text(
            //   'Ao criar uma conta está a aceitar os nossos Termos e Condições',
            //   style: theme.textTheme.caption,
            //   textAlign: TextAlign.center,
            // ), //! delete this after check
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }

  Future _launch(String url) async {
    //! copy paste from posters screen
    try {
      await launch(
        url,
        option: CustomTabsOption(
            enableUrlBarHiding: true,
            showPageTitle: true,
            animation: CustomTabsAnimation.slideIn(),
            extraCustomTabs: <String>[
              'org.mozilla.firefox',
              'com.microsoft.emmx'
            ],
            headers: {
              'title': 'Terms'
            }),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString()); //! review this
    }
  }
}
