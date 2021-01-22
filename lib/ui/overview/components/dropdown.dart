import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';

class Dropdown<T> extends StatelessWidget {
  final String hint;
  final T value;
  final List<T> items;
  final void Function(T) onChanged;

  const Dropdown({this.hint, this.value, this.items, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      height: kFormItemHeight,
      margin: EdgeInsets.symmetric(vertical: kInputVertMargin),
      padding: EdgeInsets.only(
        left: kInputHorizPadding,
        right: kInputHorizPadding * 2 / 3,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: theme.colorScheme.onBackground,
          width: 0,
        ),
        borderRadius: BorderRadius.circular(kBorderRadiusBig),
      ),
      child: DropdownButton<T>(
        isExpanded: true,
        underline: Container(),
        iconDisabledColor: theme.colorScheme.background,
        hint: Text(hint),
        icon: Icon(Icons.expand_more),
        style: theme.textTheme.bodyText1,
        onChanged: onChanged,
        value: value,
        items: items
            ?.map<DropdownMenuItem<T>>(
              (T value) => DropdownMenuItem<T>(
                value: value,
                child: Text(value.toString()),
              ),
            )
            ?.toList(),
      ),
    );
  }
}
