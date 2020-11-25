import 'package:events/app/body/regions_model.dart';
import 'package:events/domain/region.dart';
import 'package:events/ui/appbar/sliver_bar.dart';
import 'package:events/ui/body/components/list_group.dart';
import 'package:events/ui/body/components/list_subtitle.dart';
import 'package:events/ui/body/components/region_item.dart';
import 'package:events/ui/body/sliver_scaffold.dart';
import 'package:events/ui/drawer/category_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegionsModel>(
      create: (_) => RegionsModel(),
      child: Consumer<RegionsModel>(
        builder: (_, regions, __) {
          return SliverScaffold(
            drawer: CategoryDrawer(),
            appbar: SliverBar(
              title: 'Categoria', //!
            ),
            body: [
              ListGroup(
                items: [
                  RegionItem(
                    'Todos os eventos',
                    liveEvents: regions.liveEvents,
                    totalEvents: regions.totalEvents,
                  ),
                ],
              ),
              ListSubtitle('Concelhos mais próximos'),
              ListGroup(
                items: [
                  for (Region region in regions.near)
                    RegionItem(
                      region.name,
                      liveEvents: region.liveEvents,
                      totalEvents: region.totalEvents,
                    ),
                ],
              ),
              ListSubtitle('Outros concelhos'),
              ListGroup(
                items: [
                  for (Region region in regions.notNear)
                    RegionItem(
                      region.name,
                      liveEvents: region.liveEvents,
                      totalEvents: region.totalEvents,
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
