import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';

class ListSubtitle extends StatelessWidget {
  final String subtitle;

  const ListSubtitle(this.subtitle);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: kSubtitleHeight,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: kSubtitleLeftPadding),
      child: Text(
        subtitle.toUpperCase(),
        style: textTheme.subtitle2,
      ),
    );
  }
}
