import 'package:events/app/appbar/calendar_model.dart';
import 'package:events/app/appbar/scroll_model.dart';
import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:events/app/helpers/string_x.dart';

class CalendarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CalendarModel calendar = Provider.of<CalendarModel>(context);
    final ScrollModel scroll = Provider.of<ScrollModel>(context);
    final ThemeData theme = Theme.of(context);

    return scroll.isFlexbarCollapsed
        ? Container(
            margin: EdgeInsets.only(right: kAppBarHorizPadding),
            width: kAppBarButtonWidth,
            padding: EdgeInsets.symmetric(
              vertical: (kToolbarHeight - kCalendarItemWidth) / 2,
            ),
            child: FlatButton(
              onPressed: () {
                scroll.expandFlexBar();
                calendar.snapSelected();
              },
              color: theme.colorScheme.primary,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kBorderRadiusMedium),
              ),
              child: Text(
                '${calendar.selectedDay} ${calendar.selectedMonth.capitalize()}',
                style: theme.textTheme.button,
              ),
            ),
          )
        : Container(
            margin: EdgeInsets.only(right: kAppBarHorizPadding),
            width: kAppBarButtonWidth,
            child: Center(
              child: IconButton(
                icon: Icon(Icons.expand_less),
                onPressed: scroll.collapseFlexBar,
              ),
            ),
          );
  }
}
