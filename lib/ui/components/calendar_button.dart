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
    // Animatable<Color> color = TweenSequence<Color>(
    //   [
    //     TweenSequenceItem(
    //       weight: 1.0,
    //       tween: ColorTween(
    //         begin: Colors.transparent,
    //         end: theme.primaryColor,
    //       ),
    //     ),
    //     TweenSequenceItem(
    //       weight: 1.0,
    //       tween: ColorTween(
    //         begin: theme.primaryColor,
    //         end: Colors.transparent,
    //       ),
    //     ),
    //   ],
    // );

    return Container(
      margin: EdgeInsets.only(right: kAppBarHorizPadding),
      width: kAppBarButtonWidth,
      padding: EdgeInsets.symmetric(
        vertical: (AppBar().preferredSize.height - kAppBarButtonHeight) / 2,
      ),
      child: FlatButton(
        onPressed: scroll.onPressed,
        color:
            scroll.isAppBarCollapsed ? theme.primaryColor : Colors.transparent,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusMedium),
        ),
        child: scroll.isAppBarCollapsed
            ? Text('${calendar.selectedDay} ${calendar.selectedMonth}',
                style: theme.textTheme.button)
            : Icon(Icons.expand_less),
      ),
      // ),
    );
  }
}
