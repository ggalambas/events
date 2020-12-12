import 'package:events/app/appbar/calendar_model.dart';
import 'package:events/app/body/events_model.dart';
import 'package:events/app/body/regions_model.dart';
import 'package:events/app/drawer/category_model.dart';
import 'package:events/config/injection.dart';
import 'package:events/domain/categories/category.dart';
import 'package:events/domain/regions/subregion.dart';
import 'package:events/ui/appbar/sliver_bar.dart';
import 'package:events/ui/body/components/event_item.dart';
import 'package:events/ui/body/components/list_group.dart';
import 'package:events/ui/body/components/list_subtitle.dart';
import 'package:events/ui/body/sliver_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventsScreen extends StatelessWidget {
  final String regionName;

  const EventsScreen(this.regionName);

  // TODO: EventsScreen
  //* 1. collapse appbar when openned
  //* 2. empty results

  @override
  Widget build(BuildContext context) {
    final Category category =
        Provider.of<CategoryModel>(context, listen: false).selected;
    return SliverScaffold(
      appbar: SliverBar(title: category.name, subtitle: regionName),
      body: Selector<CalendarModel, DateTime>(
        selector: (_, calendar) => calendar.selected,
        builder: (_, ___, __) {
          return ChangeNotifierProvider<EventsModel>.value(
            value: getIt<EventsModel>(),
            builder: (context, _) {
              final EventsModel events = Provider.of<EventsModel>(context);
              return events.load.map(
                inProgress: SliverFillRemaining(
                  hasScrollBody: false,
                  child: Text('Loading'), //TODO: loading
                ),
                success: !events.isEmpty()
                    ? SliverList(
                        delegate: SliverChildListDelegate(
                          buildEvents(events.subregions),
                        ),
                      )
                    //! 2
                    : SliverFillRemaining(
                        hasScrollBody: false,
                        child: Text(
                          'No events today for this category and regions',
                        ),
                      ),
                failure: SliverFillRemaining(
                  hasScrollBody: false,
                  child: Text('Failure'), //TODO: failure
                ),
              );
            },
          );
        },
      ),
    );
  }
}

List<Widget> buildEvents(List<Subregion> subregions) {
  print('buildng list');
  List<Widget> list = [];

  for (final subregion in subregions) {
    list.add(ListSubtitle(subregion.name));
    list.add(ListGroup(
      items: [
        for (final event in subregion.events) EventItem(event),
      ],
    ));
  }

  return list;
}
