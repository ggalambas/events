import 'package:events/app/calendar_model.dart';
import 'package:events/app/constants.dart';
import 'package:events/ui/components/calendar_button.dart';
import 'package:events/ui/components/calendar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomAppBar({@required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ChangeNotifierProvider<CalendarModel>(
      create: (_) => CalendarModel(),
      child: SliverAppBar(
        pinned: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(kBorderRadiusBig),
            bottomRight: Radius.circular(kBorderRadiusBig),
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: textTheme.headline6),
            if (subtitle != null) Text(subtitle, style: textTheme.caption),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {}, // TODO: Search
          ),
          CalendarButton(),
        ],
        expandedHeight: kAppBarExpandedHeight,
        flexibleSpace: Calendar(),
      ),
    );
  }
}
