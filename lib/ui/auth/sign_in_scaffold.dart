import 'package:events/app/auth/sign_in_form_model.dart';
import 'package:events/config/constants.dart';
import 'package:events/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScaffold extends StatelessWidget {
  final Widget child;
  final bool ableToGoBack;

  const SignInScaffold({@required this.child, this.ableToGoBack = false});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final SignInFormModel signInForm = Provider.of<SignInFormModel>(context);
    return Scaffold(
      appBar: ableToGoBack
          ? AppBar(backgroundColor: Colors.transparent, elevation: 0)
          : null,
      extendBodyBehindAppBar: ableToGoBack,
      backgroundColor: theme.colorScheme.surface,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SafeArea(
              child: Loading.linear(isLoading: signInForm.isSubmitting),
            ),
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              behavior: HitTestBehavior.translucent,
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(horizontal: kFormHorizPadding),
                child: SafeArea(
                  child: Form(
                    autovalidateMode: signInForm.showErrorMessages
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    child: child,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
