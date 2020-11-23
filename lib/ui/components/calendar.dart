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
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return FlexibleSpaceBar(
      background: Padding(
        padding: EdgeInsets.only(
          top: kToolbarHeight + statusBarHeight,
          bottom: kAppBarExpandedHeight - kToolbarHeight - 50,
          left: kAppBarHorizPadding,
          right: kAppBarHorizPadding,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(kBorderRadiusMedium),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: calendar.totalDays,
            separatorBuilder: (_, daysAfter) {
              return daysAfter < calendar.totalDays - 1 &&
                      calendar.isLastDayOfMonth(daysAfter)
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
                          style: textTheme.overline,
                        ),
                      ),
                    )
                  : SizedBox(width: kCalendarItemSpace);
            },
            itemBuilder: (_, daysAfter) => CalendarItem(
              weekDay: calendar.weekDay(daysAfter)[0].toUpperCase(),
              day: calendar.day(daysAfter),
              isSelected: calendar.isSelected(daysAfter),
              onPressed: () => calendar.select(daysAfter),
            ),
          ),
        ),
      ),
    );
  }
}
