import 'package:flutter/material.dart';

import 'package:events/ui/body/components/event_counters.dart';

class RegionItem extends StatelessWidget {
  final String region;
  final int liveEvents;
  final int totalEvents;

  const RegionItem(this.region, {this.liveEvents, this.totalEvents});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ListTile(
      dense: true,
      title: Text(region, style: textTheme.bodyText1),
      trailing: EventCounters(live: liveEvents, total: totalEvents),
    );
  }
}
