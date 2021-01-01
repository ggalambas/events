import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final void Function(String) onChanged;
  final String Function(String) validator;

  const InputField({
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      height: kFormItemHeight,
      margin: EdgeInsets.symmetric(vertical: kInputVertMargin),
      padding: EdgeInsets.symmetric(horizontal: kInputHorizPadding),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.onBackground, width: 0),
        borderRadius: BorderRadius.circular(kBorderRadiusBig),
      ),
      child: TextFormField(
        obscureText: obscureText,
        style: theme.textTheme.bodyText1,
        cursorColor: theme.colorScheme.primary,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: theme.textTheme.bodyText1,
          border: InputBorder.none,
        ),
        autocorrect: false,
        onChanged: onChanged,
        validator: validator,
      ),
    );
  }
}
