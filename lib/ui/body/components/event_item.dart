import 'package:events/domain/events/event.dart';
import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  final Event event;

  const EventItem(this.event);

  String get name => event.name.getOrCrash();
  DateTime get time => event.time;

  //! ^

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ListTile(
      dense: true,
      leading: Text(
        '${time.hour.toString()}:${time.minute.toString()}', //! use date format
        style: theme.textTheme.bodyText1.copyWith(fontWeight: FontWeight.w500),
      ),
      title: Text(name, style: theme.textTheme.bodyText1), //!
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
