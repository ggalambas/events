import 'package:events/app/appbar/calendar_model.dart';
import 'package:events/app/body/events_model.dart';
import 'package:events/config/injection.dart';
import 'package:events/domain/categories/category.dart';
import 'package:events/domain/events/event.dart';
import 'package:events/domain/regions/region.dart';
import 'package:events/ui/appbar/sliver_bar.dart';
import 'package:events/ui/body/components/event_item.dart';
import 'package:events/ui/body/components/list_group.dart';
import 'package:events/ui/body/components/list_subtitle.dart';
import 'package:events/ui/body/sliver_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventsView extends StatelessWidget {
  final Category category;
  final Region region;

  const EventsView({@required this.category, @required this.region});

  @override
  Widget build(BuildContext context) {
    // TODO: EventsView: collapse appbar
    // final ScrollModel scroll = Provider.of<ScrollModel>(context);
    // scroll.collapseFlexBar();
    return SliverScaffold(
      appbar: SliverBar(title: category.name, subtitle: region.name),
      body: Selector<CalendarModel, DateTime>(
        selector: (_, calendar) => calendar.selected,
        builder: (_, date, __) {
          return ChangeNotifierProvider<EventsModel>.value(
            value: getIt<EventsModel>()..listen(region.id.getOrCrash()),
            builder: (context, _) {
              final EventsModel events = Provider.of<EventsModel>(context);
              return events.load.map(
                inProgress: SliverFillRemaining(
                  hasScrollBody: false,
                  child: Text('Loading'), // TODO: Regions loading
                ),
                failure: SliverFillRemaining(
                  hasScrollBody: false,
                  child: Text('Failure'), // TODO: Regions failure
                ),
                success: !events.isEmpty()
                    ? SliverList(
                        delegate: SliverChildListDelegate(
                            buildEvents(events.subregions)),
                      )
                    : SliverFillRemaining(
                        hasScrollBody: false,
                        child: Text(
                          'No events today for this category and regions',
                        ), // TODO: Regions no events
                      ),
              );
            },
          );
        },
      ),
    );
  }
}

List<Widget> buildEvents(Map<String, List<Event>> subregions) {
  final List<Widget> list = [];
  List<Widget> events;
  for (final String subregion in subregions.keys) {
    list.add(ListSubtitle(subregion));
    events = [];
    for (final Event event in subregions[subregion]) {
      events.add(EventItem(event));
    }
    list.add(ListGroup(items: events));
  }
  return list;
}
