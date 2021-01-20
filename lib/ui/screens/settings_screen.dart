import 'package:events/app/auth/auth_model.dart';
import 'package:events/config/constants.dart';
import 'package:events/ui/appbar/rounded_bar.dart';
import 'package:events/ui/body/components/list_group.dart';
import 'package:events/ui/body/components/list_subtitle.dart';
import 'package:events/ui/settings/components/setting_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//TODO
//* Merge all listTiles

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    int selected = 2;
    return Scaffold(
      appBar: RoundedBar(
        title: 'Settings',
      ),
      body: ListView(
        children: [
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
                onPressed: () {},
              ),
            ],
          ),
          ListSubtitle('Conta'),
          ListGroup(
            items: [
              SettingItem.more(
                title: 'Definições de conta',
                onPressed: () {},
              ),
              SettingItem.more(
                title: 'Créditos',
                onPressed: () {},
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
                onTap: () =>
                    Provider.of<AuthModel>(context, listen: false).signedOut(),
              ),
            ],
          ),
          ListSubtitle('Tema'),
          ListGroup(
            items: [
              SettingItem.selection(
                title: 'Modo',
                options: ['Claro', 'Escuro', 'Automático'],
                selected: selected,
                onPressed: (i) => selected = i,
              ),
            ],
          ),
          ListSubtitle('Preferências'),
          ListGroup(
            items: [
              SettingItem.selection(
                title: 'Categoria inicial',
                options: List.generate(15, (i) => 'Category ${i + 1}'),
                selected: selected,
                onPressed: (i) => selected = i,
              ),
              SettingItem.more(
                title: 'Categorias favoritas',
                onPressed: () {},
              ),
            ],
          ),
          ListSubtitle('Aplicação'),
          ListGroup(
            items: [
              SettingItem.more(
                title: 'Classificar a aplicação',
                onPressed: () {},
              ),
              SettingItem.more(
                title: 'FAQ',
                onPressed: () {},
              ),
              SettingItem.more(
                title: 'Feedback',
                onPressed: () {},
              ),
              SettingItem.more(
                title: 'Termos e Condições',
                onPressed: () {},
              ),
              SettingItem.more(
                title: 'Política de Privacidade',
                onPressed: () {},
              ),
              SettingItem.info(
                title: 'Versão',
                info: 'alpha',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
