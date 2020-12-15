import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AwesomeIcon extends StatelessWidget {
  const AwesomeIcon(
    this.icon, {
    Key key,
    this.size = 18,
    this.color,
    this.semanticLabel,
    this.textDirection,
  }) : super(key: key);

  final IconData icon;
  final double size;
  final Color color;
  final String semanticLabel;
  final TextDirection textDirection;

  @override
  Widget build(BuildContext context) {
    return FaIcon(
      icon,
      key: key,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
      textDirection: textDirection,
    );
  }
}
