import 'package:events/app/appbar/calendar_model.dart';
import 'package:events/app/body/regions_model.dart';
import 'package:events/app/drawer/category_model.dart';
import 'package:events/config/injection.dart';
import 'package:events/domain/categories/category.dart';
import 'package:events/ui/appbar/sliver_bar.dart';
import 'package:events/ui/body/components/list_group.dart';
import 'package:events/ui/body/components/list_subtitle.dart';
import 'package:events/ui/body/components/region_item.dart';
import 'package:events/ui/body/sliver_scaffold.dart';
import 'package:events/ui/drawer/category_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliver_tools/sliver_tools.dart';

class RegionsScreen extends StatelessWidget {
  //TODO: RegionsScreen
  //* 2. remove closer regions subitle when no closer regions
  //*    rename 'outros concelhos' to 'concelhos' if
  //* 3. empty results
  //* 4. RegionsModel
  //* 5. All Events

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Selector<CategoryModel, Category>(
      selector: (_, category) => category.selected,
      builder: (_, category, __) {
        return SliverScaffold(
          drawer: CategoryDrawer(),
          appbar:
              /*SliverStack(
            children: [
              SliverPositioned.fill(
                child: Container(color: colorScheme.surface),
              ),*/
              SliverBar(title: category.name),
          //   ],
          // ),
          body: Selector<CalendarModel, DateTime>(
            selector: (_, calendar) => calendar.selected,
            builder: (_, ___, __) {
              return ChangeNotifierProvider<RegionsModel>.value(
                value: getIt<RegionsModel>(),
                builder: (context, _) {
                  final RegionsModel regions =
                      Provider.of<RegionsModel>(context);
                  return regions.load.map(
                    inProgress: SliverFillRemaining(
                      hasScrollBody: false,
                      child: Text('Loading'), //TODO: loading
                    ),
                    success: !regions.isEmpty()
                        ? SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                // ListGroup(
                                //   first: true,
                                //   items: [
                                //     RegionItem(regions.all),
                                //   ],
                                // ),
                                //! 2
                                // ListSubtitle('Concelhos mais próximos'),
                                // ListGroup(
                                //   items: [
                                //     for (Region region in regions.near)
                                //       RegionItem(region),
                                //   ],
                                // ),
                                ListSubtitle('Concelhos'),
                                ListGroup(
                                  items: [
                                    for (final region in regions.others)
                                      RegionItem(region),
                                  ],
                                ),
                              ],
                            ),
                          )
                        //! 3
                        : SliverFillRemaining(
                            hasScrollBody: false,
                            child: Text(
                              'No events today for this category',
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
      },
    );
  }
}
