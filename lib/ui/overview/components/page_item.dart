import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';

class PageItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget child;

  const PageItem({@required this.title, @required this.subtitle, this.child});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(kOverviewVertPadding),
          child: Column(
            children: [
              Text(
                title,
                style: theme.textTheme.headline4,
              ),
              SizedBox(height: 4),
              Text(
                subtitle,
                style: theme.textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(kBorderRadiusBig),
            child: child,
          ),
        ),
      ],
    );
  }
}
