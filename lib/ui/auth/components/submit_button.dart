import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const SubmitButton({this.text = '', @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kSubmitVertMargin),
      child: FlatButton(
        height: kFormItemHeight,
        minWidth: double.infinity,
        color: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusBig),
        ),
        onPressed: onPressed,
        child: Text(text, style: theme.textTheme.button),
      ),
    );
  }
}
