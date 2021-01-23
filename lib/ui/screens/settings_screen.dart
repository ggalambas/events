import 'package:events/app/auth/auth_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:events/config/constants.dart';
import 'package:events/config/routes/router.gr.dart';
import 'package:events/config/theme/theme_config.dart';
import 'package:events/ui/appbar/rounded_bar.dart';
import 'package:events/ui/body/components/list_group.dart';
import 'package:events/ui/body/components/list_subtitle.dart';
import 'package:events/ui/settings/components/setting_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:events/app/core/settings_model.dart';
import 'package:events/app/helpers/scaffold_x.dart';

//TODO
//* Merge all listTiles

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsModel>(context);
    final auth = Provider.of<AuthModel>(context, listen: false);
    final themeConfig = Provider.of<ThemeConfig>(context, listen: false);

    final ThemeData theme = Theme.of(context);
    int selected = 2;

    return Scaffold(
      appBar: RoundedBar(
        title: 'Settings',
      ),
      body: ListView(
        children: [
          ListSubtitle('Conta'),
          ListGroup(
            items: [
              SettingItem.more(
                title: 'Definições da conta',
                onTap: () {},
              ),
              SettingItem.more(
                title: 'Créditos',
                onTap: () {},
              ),
              SettingItem.more(
                title: 'Gestão de Eventos',
                onTap: () {},
              ),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kBorderRadiusBig),
                ),
                dense: true,
                title: Text(
                  'Sair',
                  style: theme.textTheme.bodyText1.copyWith(
                    color: theme.colorScheme.error,
                  ),
                ),
                onTap: () => auth.signedOut(),
              ),
            ],
          ),
          ListSubtitle('Notificações'),
          ListGroup(
            items: [
              SettingItem.toggle(
                title: 'Receber notificações',
                value: true,
                onChanged: (newValue) {},
              ),
              SettingItem.more(
                title: 'Definições de notificação',
                onTap: () {},
              ),
            ],
          ),
          ListSubtitle('Preferências'),
          ListGroup(
            items: [
              SettingItem.selection(
                title: 'Tema',
                options: themeConfig.options,
                selected: themeConfig.selected,
                onPressed: (i) => themeConfig.selected = i,
              ),
              SettingItem.selection(
                title: 'Categoria inicial',
                options: List.generate(15, (i) => 'Category ${i + 1}'),
                selected: selected,
                onPressed: (i) => selected = i,
              ),
              SettingItem.more(
                title: 'Categorias favoritas',
                onTap: () {},
              ),
              SettingItem.more(
                title: 'Local de residência',
                onTap: () =>
                    ExtendedNavigator.of(context).pushChangeRegionScreen(),
              ),
            ],
          ),
          ListSubtitle('Suporte'),
          ListGroup(
            items: [
              SettingItem.more(
                title: 'Classificar a aplicação',
                onTap: () {},
              ),
              SettingItem.more(
                title: 'FAQ',
                onTap: () {},
              ),
              SettingItem.more(
                title: 'Feedback',
                onTap: () {},
              ),
            ],
          ),
          ListSubtitle('Sobre'),
          ListGroup(
            items: [
              SettingItem.more(
                title: 'Termos e Condições',
                onTap: () {},
              ),
              SettingItem.more(
                title: 'Política de Privacidade',
                onTap: () {},
              ),
              SettingItem.info(
                title: 'Versão',
                info: 'alpha',
              ),
            ],
          ),
        ],
      ),
    ).rounded(context);
  }
}
