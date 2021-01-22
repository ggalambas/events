import 'package:events/config/constants.dart';
import 'package:events/ui/appbar/rounded_bar.dart';
import 'package:events/ui/body/components/list_group.dart';
import 'package:events/ui/settings/components/setting_item.dart';
import 'package:flutter/material.dart';

class ChangeRegionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: RoundedBar(
        title: 'Local de Residência',
      ),
      body: ListView(
        children: [
          ListGroup(
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
    );
  }
}
