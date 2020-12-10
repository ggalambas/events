import 'package:events/app/appbar/calendar_model.dart';
import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:events/ui/appbar/components/calendar_item.dart';

class Calendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CalendarModel calendar = Provider.of<CalendarModel>(context);
    final TextTheme textTheme = Theme.of(context).textTheme;
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return FlexibleSpaceBar(
      background: Padding(
        padding: EdgeInsets.only(
          top: kToolbarHeight + statusBarHeight,
          bottom: kAppBarExpandedHeight - kToolbarHeight - kCalendarItemHeight,
          left: kAppBarHorizPadding,
          right: kAppBarHorizPadding,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(kBorderRadiusMedium),
          child: NotificationListener<ScrollEndNotification>(
            onNotification: (_) {
              calendar.snapItems();
              return false;
            },
            child: ListView.separated(
              controller: calendar.controller,
              scrollDirection: Axis.horizontal,
              itemCount: calendar.totalDays,
              separatorBuilder: (_, daysAfter) {
                return calendar.isLastDayOfMonth(daysAfter)
                    ? Padding(
                        padding: EdgeInsets.only(
                          left: kCalendarItemSpace * 4 / 3,
                          right: kCalendarItemSpace,
                        ),
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: Text(
                            calendar.nextMonth(daysAfter).toUpperCase(),
                            textAlign: TextAlign.center,
                            style: textTheme.overline.copyWith(fontSize: 12.0),
                          ),
                        ),
                      )
                    : SizedBox(width: kCalendarItemSpace);
              },
              itemBuilder: (_, daysAfter) {
                return CalendarItem(
                  weekDay: calendar.weekDay(daysAfter)[0].toUpperCase(),
                  day: calendar.day(daysAfter),
                  isSelected: calendar.isSelected(daysAfter),
                  onPressed: () => calendar.select(daysAfter),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
