import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AltSignInButton extends StatelessWidget {
  final String assetName;
  final String label;
  final void Function() onPressed;

  const AltSignInButton._({
    @required this.assetName,
    @required this.label,
    @required this.onPressed,
  });

  factory AltSignInButton.google({@required void Function() onPressed}) =>
      AltSignInButton._(
        assetName: 'assets/icons/google_icon.svg',
        label: 'Google',
        onPressed: onPressed,
      );
  factory AltSignInButton.facebook({@required void Function() onPressed}) =>
      AltSignInButton._(
        assetName: 'assets/icons/facebook_icon.svg',
        label: 'Facebook',
        onPressed: onPressed,
      );

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return OutlinedButton.icon(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kBorderRadiusBig),
            ),
          ),
          side: MaterialStateProperty.all<BorderSide>(
            BorderSide(
              color: theme.colorScheme.onBackground,
              width: 0,
            ),
          ),
          minimumSize:
              MaterialStateProperty.all<Size>(Size(0, kFormItemHeight))),
      onPressed: onPressed,
      icon: SvgPicture.asset(
        assetName,
        width: 24,
        height: 24,
      ),
      label: Text(
        label,
        style: theme.textTheme.button.copyWith(color: kAltLabelColor),
      ),
    );
  }
}
