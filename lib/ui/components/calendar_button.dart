import 'package:events/app/calendar_model.dart';
import 'package:events/app/constants.dart';
import 'package:events/app/scroll_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CalendarModel calendar = Provider.of<CalendarModel>(context);
    final ScrollModel scroll = Provider.of<ScrollModel>(context);
    final ThemeData theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.only(right: kAppBarHorizPadding),
      width: kAppBarButtonWidth,
      padding: EdgeInsets.symmetric(
        vertical: (kAppBarHeight - kAppBarButtonHeight) / 2,
      ),
      child: FlatButton(
        onPressed: scroll.toggleFlexbar,
        color:
            scroll.isFlexbarCollapsed ? theme.primaryColor : Colors.transparent,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusMedium),
        ),
        child: scroll.isFlexbarCollapsed
            ? Text('${calendar.selectedDay} ${calendar.selectedMonth}',
                style: theme.textTheme.button)
            : Icon(Icons.expand_less),
      ),
    );
  }
}
