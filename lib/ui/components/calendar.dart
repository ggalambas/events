import 'package:events/app/calendar_model.dart';
import 'package:events/ui/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:events/ui/components/calendar_item.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CalendarModel calendar = Provider.of<CalendarModel>(context);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final double appBarHeight = AppBar().preferredSize.height;
    return FlexibleSpaceBar(
      background: Padding(
        padding: EdgeInsets.only(
          top: appBarHeight,
          bottom: kAppBarExpandedHeight - appBarHeight - 50,
          left: kAppBarHorizPadding,
          right: kAppBarHorizPadding,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(kBorderRadiusMedium),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: calendar.totalDays,
            separatorBuilder: (_, day) {
              return !calendar.isLastDayOfMonth(day)
                  ? SizedBox(width: kCalendarItemSpace)
                  : Padding(
                      padding: EdgeInsets.only(
                        left: kCalendarItemSpace * 4 / 3,
                        right: kCalendarItemSpace,
                      ),
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          calendar.nextMonth(day).toUpperCase(),
                          textAlign: TextAlign.center,
                          style: textTheme.overline,
                        ),
                      ),
                    );
            },
            itemBuilder: (_, day) => CalendarItem(
              weekDay: calendar.weekday(day)[0].toUpperCase(),
              day: calendar.day(day),
              isSelected: calendar.isSelected(day),
              onPressed: () => calendar.select(day),
            ),
          ),
        ),
      ),
    );
  }
}
