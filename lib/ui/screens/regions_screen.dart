import 'package:events/app/appbar/calendar_model.dart';
import 'package:events/app/body/region_counters_model.dart';
import 'package:events/app/drawer/category_model.dart';
import 'package:events/config/injection.dart';
import 'package:events/domain/categories/category.dart';
import 'package:events/ui/appbar/sliver_bar.dart';
import 'package:events/ui/body/components/list_group.dart';
import 'package:events/ui/body/components/list_subtitle.dart';
import 'package:events/ui/body/components/region_item.dart';
import 'package:events/ui/body/components/sliver_empty_page.dart';
import 'package:events/ui/body/sliver_scaffold.dart';
import 'package:events/ui/drawer/category_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegionsScreen extends StatelessWidget {
  //TODO
  //* 1. remove closer regions subitle when no closer regions
  //*    rename 'outros concelhos' to 'concelhos' if
  //* 2. all Events
  //* 3. filter regions based on residence and current location
  //* 4. order regions by name
  //* 5. last list group fix bottom border radius

  @override
  Widget build(BuildContext context) {
    // final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Selector<CategoryModel, Category>(
      selector: (_, category) => category.selected,
      builder: (_, category, __) {
        return SliverScaffold(
          drawer: CategoryDrawer(),
          //! 2
          appBar:
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
              return ChangeNotifierProvider<RegionCountersModel>.value(
                value: getIt<RegionCountersModel>(),
                builder: (context, _) {
                  final RegionCountersModel regions =
                      Provider.of<RegionCountersModel>(context);
                  return regions.load.map(
                    inProgress: SliverFillRemaining(
                      hasScrollBody: false,
                      child: Text('Loading'), //TODO: loading
                    ),
                    success: !regions.isEmpty()
                        ? SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                //! 2
                                // ListGroup(
                                //   first: true,
                                //   items: [
                                //     RegionItem(regions.all),
                                //   ],
                                // ),
                                //! 1
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
                        : SliverEmptyPage(
                            icon: category.icon,
                            message:
                                'Sem eventos de ${category.name} para este dia',
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
