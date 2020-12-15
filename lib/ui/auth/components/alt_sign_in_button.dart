import 'package:events/app/helpers/awesome_icon.dart';
import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AltSignInButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final void Function() onPressed;

  const AltSignInButton._({
    @required this.icon,
    @required this.onPressed,
    @required this.color,
  });

  factory AltSignInButton.google({@required void Function() onPressed}) =>
      AltSignInButton._(
        icon: FontAwesomeIcons.google,
        color: Colors.redAccent,
        onPressed: onPressed,
      );
  factory AltSignInButton.facebook({@required void Function() onPressed}) =>
      AltSignInButton._(
        icon: FontAwesomeIcons.facebookF,
        color: Colors.blueAccent,
        onPressed: onPressed,
      );

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      height: kFormItemHeight,
      width: kFormItemHeight,
      margin: EdgeInsets.symmetric(
        horizontal: kAltHorizMargin,
        vertical: kAltVertMargin,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(kBorderRadiusBig),
      ),
      child: IconButton(
        icon: AwesomeIcon(icon, color: colorScheme.onPrimary),
        onPressed: onPressed,
      ),
    );
  }
}
