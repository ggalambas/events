import 'package:events/ui/components/custom_app_bar.dart';
import 'package:events/ui/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:events/app/scroll_model.dart';
import 'package:provider/provider.dart';

List<String> concelhos = [
  'Mafra',
  'Loures',
  'Sintra',
  'Torres Vedras',
  'Abrantes',
  'Águeda',
  'Aguiar da Beira',
  'Alandroal',
  'Albergaria-a-Velha',
  'Albufeira',
  'Alcácer do Sal',
  'Alcanena'
];

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScrollModel scroll = Provider.of<ScrollModel>(context, listen: false);
    return Scaffold(
      drawer: Drawer(),
      body: NotificationListener<ScrollEndNotification>(
        onNotification: (_) {
          scroll.snapFlexbar();
          return false;
        },
        child: CustomScrollView(
          // physics: BouncingScrollPhysics(),
          physics:
              AlwaysScrollableScrollPhysics(), //TODO: Scroll physics not working
          controller: scroll.controller,
          slivers: <Widget>[
            CustomAppBar(
              title: 'Categoria', //!
            ),
            CustomList(),
            // SliverFillRemaining(
            //   hasScrollBody: false,
            //   // TODO fill reaming child
            // ),
          ],
        ),
      ),
    );
  }
}

class CustomList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate.fixed(
        [
          ListGroup(),
          ListSubtitle('Concelhos mais próximos'),
          ListGroup(),
          ListSubtitle('Outros concelhos'),
          ListGroup(),
        ],
      ),
    );
  }
}

class ListGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(kBorderRadiusBig),
      ),
      child: Column(
        children: [
          RegionListItem(),
          RegionListItem(),
        ],
      ),
    );
  }
}

class RegionListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ListTile(
      dense: true,
      title: Text('Todos os eventos', style: textTheme.bodyText1),
      trailing: EventCounters(live: 17, total: 58),
    );
  }
}

class EventCounters extends StatelessWidget {
  final int live;
  final int total;

  const EventCounters({@required this.live, @required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (live != 0) EventCounter(live, live: true),
        EventCounter(total),
      ],
    );
  }
}

class EventCounter extends StatelessWidget {
  final int counter;
  final bool live;

  const EventCounter(this.counter, {this.live = false});

  double get size => 24.0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      margin: live ? EdgeInsets.only(right: 5.0) : EdgeInsets.zero,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: live
            ? theme.colorScheme.primary.withOpacity(kPrimaryOpacity)
            : theme.colorScheme.background,
        borderRadius: BorderRadius.circular(kBorderRadiusSmall),
      ),
      child: Center(
        child: Text(
          counter.toString(),
          style: theme.textTheme.bodyText2.copyWith(
            color: live
                ? theme.colorScheme.primary
                : theme.colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}

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

class EventListItem extends StatelessWidget {
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
