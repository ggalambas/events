import 'package:events/app/appbar/calendar_model.dart';
import 'package:events/app/body/regions_model.dart';
import 'package:events/app/drawer/category_model.dart';
import 'package:events/config/injection.dart';
import 'package:events/domain/categories/category.dart';
import 'package:events/domain/regions/region.dart';
import 'package:events/ui/appbar/sliver_bar.dart';
import 'package:events/ui/body/components/list_group.dart';
import 'package:events/ui/body/components/list_subtitle.dart';
import 'package:events/ui/body/components/region_item.dart';
import 'package:events/ui/body/sliver_scaffold.dart';
import 'package:events/ui/drawer/category_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:tuple/tuple.dart';

class RegionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return SliverScaffold(
      drawer: CategoryDrawer(),
      appbar: SliverStack(
        positionedAlignment: Alignment.topCenter,
        children: [
          SliverPositioned.fill(child: Container(color: colorScheme.surface)),
          Selector<CategoryModel, Category>(
            selector: (_, category) => category.selected,
            builder: (_, category, __) => SliverBar(title: category.name),
          ),
        ],
      ),
      body: Selector2<CategoryModel, CalendarModel, Tuple2<Category, DateTime>>(
        selector: (_, category, calendar) =>
            Tuple2(category.selected, calendar.selected),
        builder: (_, selected, __) {
          return ChangeNotifierProvider<RegionsModel>.value(
            value: getIt<RegionsModel>()..listen(),
            builder: (context, _) {
              final RegionsModel regions = Provider.of<RegionsModel>(context);
              return Consumer<RegionsModel>(
                builder: (_, regions, __) => regions.load.map(
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
                                first: true,
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
