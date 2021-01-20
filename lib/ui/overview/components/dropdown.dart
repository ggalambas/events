import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  final String hint;
  final List<String> items;

  const Dropdown({this.hint, this.items});

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
        border: Border.all(color: theme.colorScheme.onBackground, width: 0),
        borderRadius: BorderRadius.circular(kBorderRadiusBig),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        underline: Container(),
        hint: Text(hint),
        icon: Icon(Icons.expand_more),
        style: theme.textTheme.bodyText1,
        onChanged: (value) {},
        items: items
            .map<DropdownMenuItem<String>>(
              (String value) => DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              ),
            )
            .toList(),
      ),
    );
  }
}
