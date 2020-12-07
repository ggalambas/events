import 'package:auto_route/auto_route.dart';
import 'package:events/config/routes/router.gr.dart';
import 'package:events/domain/events/event.dart';
import 'package:flutter/material.dart';
import 'package:events/app/helpers/date_time_x.dart';

class EventItem extends StatelessWidget {
  final Event event;

  const EventItem(this.event);

  String get name => event.name.getOrCrash(); //!
  DateTime get date => event.date;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ListTile(
      dense: true,
      onTap: () => ExtendedNavigator.root.pushPosterView(event: event),
      leading: Text(
        date.time,
        style: theme.textTheme.bodyText2,
      ),
      title: Text(name, style: theme.textTheme.bodyText1),
      trailing: IconButton(
        //TODO [BUG] splash behind group
        icon: Icon(
          Icons.bookmark_border,
          color: theme.colorScheme.onBackground,
        ),
        onPressed: () {}, // TODO: Bookmark, save and change icon
      ),
    );
  }
}
