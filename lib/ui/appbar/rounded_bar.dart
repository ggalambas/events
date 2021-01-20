import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';

class RoundedBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget leading;
  final bool automaticallyImplyLeading;
  final String title;
  final String subtitle;
  final TextStyle titleStyle;
  final List<Widget> actions;
  final double elevation;

  const RoundedBar({
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.subtitle,
    this.titleStyle,
    this.actions,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return AppBar(
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Text(title, style: titleStyle ?? textTheme.headline6),
          if (subtitle != null) Text(subtitle, style: textTheme.subtitle1),
        ],
      ),
      actions: actions,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(kBorderRadiusBig),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
