import 'package:auto_route/auto_route.dart';
import 'package:events/app/body/regions_model.dart';
import 'package:events/config/constants.dart';
import 'package:events/config/routes/router.gr.dart';
import 'package:events/domain/core/event_counter.dart';
import 'package:events/domain/regions/region.dart';
import 'package:events/ui/body/components/counters.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegionItem extends StatelessWidget {
  final Region region;

  const RegionItem(this.region);

  String get id => region.id;
  String get name => region.name;
  EventCounter get counter => region.eventCounter;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadiusBig),
      ),
      dense: true,
      onTap: () {
        Provider.of<RegionsModel>(context, listen: false).selected = region;
        ExtendedNavigator.root.pushEventsScreen(regionName: name);
      },
      title: Text(name, style: textTheme.bodyText1),
      trailing: Counters(counter),
    );
  }
}
