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
      leading: Text(
        date.time,
        style: theme.textTheme.bodyText1.copyWith(fontWeight: FontWeight.w500),
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
