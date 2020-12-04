import 'package:events/app/appbar/calendar_model.dart';
import 'package:events/app/body/regions_model.dart';
import 'package:events/app/drawer/category_model.dart';
import 'package:events/config/injection.dart';
import 'package:events/domain/regions/region.dart';
import 'package:events/ui/appbar/sliver_bar.dart';
import 'package:events/ui/body/components/list_group.dart';
import 'package:events/ui/body/components/list_subtitle.dart';
import 'package:events/ui/body/components/region_item.dart';
import 'package:events/ui/core/base_widget.dart';
import 'package:events/ui/body/sliver_scaffold.dart';
import 'package:events/ui/drawer/category_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class RegionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverScaffold(
      drawer: CategoryDrawer(),
      appbar: Selector<CategoryModel, String>(
        selector: (_, category) => category.selected,
        builder: (_, categoryName, __) => SliverBar(title: categoryName),
      ),
      body: Selector2<CategoryModel, CalendarModel, Tuple2<String, DateTime>>(
        selector: (_, category, calendar) =>
            Tuple2(category.selected, calendar.selected),
        builder: (context, selected, _) {
          final String categoryName = selected.item1;
          final DateTime day = selected.item2;

          return BaseWidget<RegionsModel>(
            model: getIt<RegionsModel>(),
            onModelReady: (regions) => regions.listen(categoryName, day),
            builder: (_, regions, __) {
              return regions.load.map(
                inProgress: SliverFillRemaining(
                  hasScrollBody: false,
                  child: Text('Loading'), // TODO: Regions loading
                ),
                failure: SliverFillRemaining(
                  hasScrollBody: false,
                  child: Text('Failure'), // TODO: Regions failure
                ),
                success: !regions.isEmpty()
                    ? SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            ListGroup(
                              // TODO: Extend first group height to start of screen
                              items: [
                                RegionItem(regions.all),
                              ],
                            ),
                            ListSubtitle('Concelhos mais próximos'),
                            ListGroup(
                              items: [
                                for (Region region in regions.near)
                                  RegionItem(region),
                              ],
                            ),
                            ListSubtitle('Outros concelhos'),
                            ListGroup(
                              items: [
                                for (Region region in regions.others)
                                  RegionItem(region),
                              ],
                            ),
                          ],
                        ),
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
//     : SliverFillRemaining(
//         hasScrollBody: false,
//         // TODO no body, child
//         child: Center(child: Text('no events')),
//       ),
