import 'package:flutter/material.dart';

class ListSubtitle extends StatelessWidget {
  final String subtitle;

  const ListSubtitle(this.subtitle);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      height: 24,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 16),
      child: Text(
        subtitle.toUpperCase(),
        style: textTheme.overline,
      ),
    );
  }
}
