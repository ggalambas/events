import 'package:events/app/auth/sign_in_form_model.dart';
import 'package:events/config/constants.dart';
import 'package:events/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScaffold extends StatelessWidget {
  final Widget child;
  final bool ableToGoBack;
  final void Function() onSkip;

  const SignInScaffold({
    @required this.child,
    this.ableToGoBack = false,
    this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final SignInFormModel signInForm = Provider.of<SignInFormModel>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: ableToGoBack,
        actions: onSkip != null
            ? [
                Padding(
                  padding: EdgeInsets.all(kFormCaptionPadding),
                  child: FlatButton.icon(
                    icon: Padding(
                      padding: EdgeInsets.only(left: kFormCaptionPadding),
                      child: Text('Ignorar este passo'),
                    ),
                    label: Icon(Icons.east),
                    onPressed: onSkip,
                    highlightColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kBorderRadiusBig),
                    ),
                  ),
                ),
              ]
            : null,
      ),
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                behavior: HitTestBehavior.translucent,
                child: Container(
                  height: MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      kToolbarHeight,
                  padding: EdgeInsets.symmetric(horizontal: kFormHorizPadding),
                  child: Form(
                    autovalidateMode: signInForm.showErrorMessages
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    child: child,
                  ),
                ),
              ),
            ),
            Loading.linear(isLoading: signInForm.isSubmitting),
          ],
        ),
      ),
    );
  }
}
