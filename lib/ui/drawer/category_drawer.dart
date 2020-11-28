import 'package:events/ui/body/components/event_counters.dart';
import 'package:events/ui/body/components/list_subtitle.dart';
import 'package:flutter/material.dart';

class CategoryDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(), // To appear under the status bar
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text('galambas@gmail.com'),
            accountName: Text('galambas'),
          ),
          // TODO: Selected category color
          // TODO: Categories Model
          ListTile(
            dense: true,
            onTap: () {
              // navigation.changeTo('Guardados');
              Navigator.pop(context);
            },
            leading: Icon(
              Icons.bookmark,
              color: theme.colorScheme.onBackground,
            ),
            title: Text('Guardados', style: theme.textTheme.bodyText1),
            trailing: EventCounters(live: 7, total: 23),
          ),
          ListSubtitle('Favoritos'),
          ListTile(
            dense: true,
            onTap: () {
              // navigation.changeTo('Desporto');
              Navigator.pop(context);
            },
            leading: Icon(
              Icons.sports,
              color: theme.colorScheme.onBackground,
            ),
            title: Text('Desporto', style: theme.textTheme.bodyText1),
            trailing: EventCounters(live: 7, total: 23),
          ),
          ListTile(
            dense: true,
            onTap: () {
              // navigation.changeTo('Musica');
              Navigator.pop(context);
            },
            leading: Icon(
              Icons.music_note,
              color: theme.colorScheme.onBackground,
            ),
            title: Text('Musica', style: theme.textTheme.bodyText1),
            trailing: EventCounters(live: 7, total: 23),
          ),
          ListTile(
            dense: true,
            onTap: () {
              // navigation.changeTo('Festa');
              Navigator.pop(context);
            },
            leading: Icon(
              Icons.celebration,
              color: theme.colorScheme.onBackground,
            ),
            title: Text('Festa', style: theme.textTheme.bodyText1),
            trailing: EventCounters(live: 7, total: 23),
          ),
          ListSubtitle('Outras Categorias'),
          ListTile(
            dense: true,
            onTap: () {
              // navigation.changeTo('Cinema');
              Navigator.pop(context);
            },
            leading: Icon(
              Icons.theaters,
              color: theme.colorScheme.onBackground,
            ),
            title: Text('Cinema', style: theme.textTheme.bodyText1),
            trailing: EventCounters(live: 7, total: 23),
          ),
          ListTile(
            dense: true,
            onTap: () {
              // navigation.changeTo('Convívio');
              Navigator.pop(context);
            },
            leading: Icon(
              Icons.people,
              color: theme.colorScheme.onBackground,
            ),
            title: Text('Convívio', style: theme.textTheme.bodyText1),
            trailing: EventCounters(live: 7, total: 23),
          ),
          ListTile(
            dense: true,
            onTap: () {
              // navigation.changeTo('Exposição');
              Navigator.pop(context);
            },
            leading: Icon(
              Icons.account_balance,
              color: theme.colorScheme.onBackground,
            ),
            title: Text('Cultura', style: theme.textTheme.bodyText1),
            trailing: EventCounters(live: 7, total: 23),
          ),
          ListTile(
            dense: true,
            onTap: () {
              // navigation.changeTo('Restauração');
              Navigator.pop(context);
            },
            leading: Icon(
              Icons.fastfood,
              color: theme.colorScheme.onBackground,
            ),
            title: Text('Restauração', style: theme.textTheme.bodyText1),
            trailing: EventCounters(live: 7, total: 23),
          ),
          ListTile(
            dense: true,
            onTap: () {
              // navigation.changeTo('Teatro');
              Navigator.pop(context);
            },
            leading: Icon(
              Icons.theater_comedy,
              color: theme.colorScheme.onBackground,
            ),
            title: Text('Teatro', style: theme.textTheme.bodyText1),
            trailing: EventCounters(live: 7, total: 23),
          ),
          ListTile(
            dense: true,
            onTap: () {
              // navigation.changeTo('Teatro');
              Navigator.pop(context);
            },
            leading: Icon(
              Icons.category,
              color: theme.colorScheme.onBackground,
            ),
            title: Text('Outra', style: theme.textTheme.bodyText1),
            trailing: EventCounters(live: 7, total: 23),
          ),
          ListTile(
            dense: true,
            onTap: () {
              // navigation.changeTo('Teatro');
              Navigator.pop(context);
            },
            leading: Icon(
              Icons.category,
              color: theme.colorScheme.onBackground,
            ),
            title: Text('Outra', style: theme.textTheme.bodyText1),
            trailing: EventCounters(live: 7, total: 23),
          ),
          ListTile(
            dense: true,
            onTap: () {
              // navigation.changeTo('Teatro');
              Navigator.pop(context);
            },
            leading: Icon(
              Icons.category,
              color: theme.colorScheme.onBackground,
            ),
            title: Text('Outra', style: theme.textTheme.bodyText1),
            trailing: EventCounters(live: 7, total: 23),
          ),
        ],
      ),
    );
  }
}
