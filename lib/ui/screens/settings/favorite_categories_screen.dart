import 'package:events/ui/appbar/rounded_bar.dart';
import 'package:events/ui/body/components/list_group.dart';
import 'package:events/ui/settings/components/setting_item.dart';
import 'package:flutter/material.dart';
import 'package:events/app/helpers/scaffold_x.dart';

class FavoriteCategoriesScreen extends StatelessWidget {
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
                options: ['Portugal'],
                selected: 0,
                onPressed: (i) {},
              ),
            ],
          ),
        ],
      ),
    ).rounded(context);
  }
}
