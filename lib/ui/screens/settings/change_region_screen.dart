import 'package:events/app/helpers/scaffold_x.dart';
import 'package:events/ui/appbar/rounded_bar.dart';
import 'package:events/ui/body/components/list_group.dart';
import 'package:events/ui/settings/components/setting_item.dart';
import 'package:flutter/material.dart';

class ChangeRegionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RoundedBar(
        title: 'Local de Residência',
        withBackground: true,
      ),
      body: ListView(
        children: [
          ListGroup(
            first: true,
            items: [
              SettingItem.selection(
                title: 'País',
                options: const ['Portugal'],
                selected: 0,
                onPressed: (i) {},
              ),
              SettingItem.selection(
                title: 'Distrito',
                options: const ['Lisboa', 'Leiria', 'Setúbal'],
                selected: 0,
                onPressed: (i) {},
              ),
              SettingItem.selection(
                title: 'Concelho',
                options: const ['Lagos', 'Mafra', 'Torres-Vedras'],
                selected: 1,
                onPressed: (i) {},
              ),
            ],
          ),
        ],
      ),
    ).rounded(context);
  }
}
