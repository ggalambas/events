import 'package:events/app/appbar/calendar_model.dart';
import 'package:events/app/body/events_model.dart';
import 'package:events/config/injection.dart';
import 'package:events/domain/events/event.dart';
import 'package:events/ui/appbar/sliver_bar.dart';
import 'package:events/ui/body/components/event_item.dart';
import 'package:events/ui/body/components/list_group.dart';
import 'package:events/ui/body/components/list_subtitle.dart';
import 'package:events/ui/core/base_widget.dart';
import 'package:events/ui/body/sliver_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventsView extends StatelessWidget {
  final String categoryName;
  final String regionName;

  const EventsView({@required this.categoryName, @required this.regionName});

  @override
  Widget build(BuildContext context) {
    // TODO: EventsView: collapse appbar
    // final ScrollModel scroll = Provider.of<ScrollModel>(context);
    // scroll.collapseFlexBar();
    return SliverScaffold(
      appbar: SliverBar(title: categoryName, subtitle: regionName),
      body: Selector<CalendarModel, DateTime>(
        selector: (_, calendar) => calendar.selected,
        builder: (context, day, _) {
          return BaseWidget<EventsModel>(
            model: getIt<EventsModel>(),
            onModelReady: (events) =>
                events.listen(categoryName, day, regionName),
            builder: (_, events, __) {
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
                          'No events today for this category',
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
