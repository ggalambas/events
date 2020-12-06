import 'package:events/config/constants.dart';
import 'package:events/ui/appbar/components/calendar_button.dart';
import 'package:events/ui/appbar/components/calendar.dart';
import 'package:flutter/material.dart';

class SliverBar extends StatelessWidget {
  final String title;
  final String subtitle;

  const SliverBar({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SliverAppBar(
      // forceElevated: true,
      pinned: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(kBorderRadiusBig),
        ),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: textTheme.headline6),
          if (subtitle != null) Text(subtitle, style: textTheme.subtitle1),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {}, // TODO: Search Screen
        ),
        CalendarButton(),
      ],
      expandedHeight: kAppBarExpandedHeight,
      flexibleSpace: Calendar(),
    );
  }
}
