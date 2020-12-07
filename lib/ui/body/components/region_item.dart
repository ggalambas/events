import 'package:auto_route/auto_route.dart';
import 'package:events/app/drawer/category_model.dart';
import 'package:events/config/routes/router.gr.dart';
import 'package:events/domain/categories/category.dart';
import 'package:events/domain/core/event_counter.dart';
import 'package:events/domain/regions/region.dart';
import 'package:events/ui/body/components/counters.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegionItem extends StatelessWidget {
  final Region region;

  const RegionItem(this.region);

  String get id => region.id.getOrCrash();
  String get name => region.name;
  EventCounter get counter => region.eventCounter;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Category category =
        Provider.of<CategoryModel>(context, listen: false).selected;
    return ListTile(
      dense: true,
      onTap: () => ExtendedNavigator.root
          .pushEventsView(category: category, region: region),
      title: Text(name, style: textTheme.bodyText1),
      trailing: Counters(counter),
    );
  }
}
