import 'package:events/app/calendar_model.dart';
import 'package:events/app/scroll_model.dart';
import 'package:events/ui/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CalendarModel calendar = Provider.of<CalendarModel>(context);
    final ScrollModel scroll = Provider.of<ScrollModel>(context);
    final ThemeData theme = Theme.of(context);

    return scroll.isFlexbarCollapsed
        ? Container(
            //TODO: TOo long to build
            margin: EdgeInsets.only(right: kAppBarHorizPadding),
            width: kAppBarButtonWidth,
            padding: EdgeInsets.symmetric(
              vertical: (kToolbarHeight - kCalendarItemWidth) / 2,
            ),
            child: FlatButton(
              onPressed: scroll.toggleFlexbar,
              color: theme.primaryColor,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kBorderRadiusMedium),
              ),
              child: Text(
                '${calendar.selectedDay} ${calendar.selectedMonth}',
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
                onPressed: scroll.toggleFlexbar,
              ),
            ),
          );
  }
}
