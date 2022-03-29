import 'package:auto_route/auto_route.dart';
import 'package:events/app/helpers/date_time_x.dart';
import 'package:events/config/constants.dart';
import 'package:events/config/routes/router.gr.dart';
import 'package:events/domain/events/event.dart';
import 'package:flutter/material.dart';

//TODO
//* 1. [BUG] splash behind group
//* 2. Bookmark

class EventItem extends StatelessWidget {
  final Event event;

  const EventItem(this.event);

  String get name => event.name.getOrCrash(); //!
  DateTime get date => event.date;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadiusBig),
      ),
      dense: true,
      onTap: () => ExtendedNavigator.of(context).pushPosterScreen(event: event),
      leading: Text(
        date.time,
        style: theme.textTheme.bodyText2,
      ),
      title: Text(name, style: theme.textTheme.bodyText1),
      trailing: IconButton(
        //! 1
        icon: Icon(
          Icons.bookmark_border,
          color: theme.colorScheme.onBackground,
        ),
        onPressed: () {}, //! 2
      ),
    );
  }
}
