import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final void Function(String) onChanged;
  final String Function(String) validator;
  final TextInputAction textInputAction;

  const InputField({
    this.hintText = '',
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.textInputAction,
  });

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _isObscured = true;
  bool get isObscured => _isObscured;
  set isObscured(bool obscured) => setState(() => _isObscured = obscured);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      height: kFormItemHeight,
      margin: EdgeInsets.symmetric(vertical: kInputVertMargin),
      padding: widget.obscureText
          ? EdgeInsets.only(left: kInputHorizPadding)
          : EdgeInsets.symmetric(horizontal: kInputHorizPadding),
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.onBackground, width: 0),
        borderRadius: BorderRadius.circular(kBorderRadiusBig),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              textInputAction: widget.textInputAction,
              obscureText: widget.obscureText && isObscured,
              style: theme.textTheme.bodyText1,
              cursorColor: theme.colorScheme.primary,
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: theme.textTheme.bodyText1,
                border: InputBorder.none,
              ),
              autocorrect: false,
              onChanged: widget.onChanged,
              validator: widget.validator,
            ),
          ),
          if (widget.obscureText)
            IconButton(
              icon: Icon(
                isObscured ? Icons.visibility : Icons.visibility_off,
                color: theme.colorScheme.onBackground,
                size: 20,
              ),
              onPressed: () => isObscured = !isObscured,
            ),
        ],
      ),
    );
  }
}
