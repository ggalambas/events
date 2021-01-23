import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final Widget Function(BuildContext) trailing;
  final void Function() onTap;

  const SettingItem._({
    this.title,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadiusBig),
      ),
      dense: true,
      title: Text(title, style: theme.textTheme.bodyText1),
      trailing: trailing(context),
    );
  }

  factory SettingItem.toggle({
    @required String title,
    @required bool value,
    @required void Function(bool) onChanged,
  }) =>
      SettingItem._(
        title: title,
        trailing: (context) => Switch(
          value: value,
          onChanged: onChanged,
          activeColor: Theme.of(context).colorScheme.primary,
        ),
      );

  factory SettingItem.more({
    @required String title,
    @required void Function() onTap,
  }) =>
      SettingItem._(
        title: title,
        trailing: (_) => Icon(Icons.chevron_right),
        onTap: onTap,
      );

  factory SettingItem.selection({
    @required String title,
    @required List<String> options,
    @required int selected,
    @required void Function(int) onPressed,
  }) {
    return SettingItem._(
      title: title,
      trailing: (context) {
        final ThemeData theme = Theme.of(context);
        return TextButton(
          onPressed: () => showDialog(
            context: context,
            builder: (context) => SimpleDialog(
              title: Text(title),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kBorderRadiusBig),
              ),
              titlePadding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 12.0),
              contentPadding: EdgeInsets.only(bottom: 16.0),
              children: List.generate(
                options.length,
                (i) => SimpleDialogOption(
                  onPressed: () {
                    onPressed(i);
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      options[i],
                      style: theme.textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
            ),
          ),
          child: Text(
            options[selected],
            style: theme.textTheme.bodyText2.copyWith(
              color: theme.colorScheme.primary,
            ),
          ),
        );
      },
    );
  }

  factory SettingItem.info({
    @required String title,
    @required String info,
  }) =>
      SettingItem._(
        title: title,
        trailing: (context) {
          final ThemeData theme = Theme.of(context);
          return Text(
            info,
            style: theme.textTheme.bodyText2.copyWith(
              color: theme.colorScheme.onBackground,
            ),
          );
        },
      );
}
