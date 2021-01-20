import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';

class RoundedBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget leading;
  final bool automaticallyImplyLeading;
  final String title;
  final TextStyle titleStyle;
  final List<Widget> actions;
  final double elevation;

  const RoundedBar({
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.titleStyle,
    this.actions,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AppBar(
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: Text(title, style: titleStyle ?? theme.textTheme.headline6),
      actions: actions,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(kBorderRadiusBig),
        ),
      ),
      // backgroundColor: theme.colorScheme.surface,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
