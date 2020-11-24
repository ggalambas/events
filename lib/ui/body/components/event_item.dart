import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ListTile(
      dense: true,
      leading: Text(
        '18:00',
        style: theme.textTheme.bodyText1.copyWith(fontWeight: FontWeight.w500),
      ),
      title: Text('A Lenda do Convento', style: theme.textTheme.bodyText1),
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
