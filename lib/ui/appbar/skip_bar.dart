import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';

class SkipBar extends StatelessWidget implements PreferredSizeWidget {
  final void Function() onSkip;

  const SkipBar({
    @required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AppBar(
      elevation: 0,
      actions: [
        Padding(
          padding: EdgeInsets.all(kFormCaptionPadding),
          child: FlatButton.icon(
            icon: Padding(
              padding: EdgeInsets.only(left: kFormCaptionPadding),
              child: Text(
                'Ignorar este passo',
                style: theme.textTheme.bodyText2,
              ),
            ),
            label: Icon(Icons.east),
            onPressed: onSkip,
            highlightColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kBorderRadiusBig),
            ),
          ),
        ),
      ],
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
