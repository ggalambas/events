import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';

class CalendarItem extends StatelessWidget {
  final String weekDay;
  final String day;
  final bool isSelected;
  final void Function() onPressed;

  const CalendarItem({
    this.weekDay,
    this.day,
    this.isSelected = false,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle weekDayStyle = theme.textTheme.overline;
    final TextStyle dayStyle = theme.textTheme.button;
    return SizedBox(
      width: kCalendarItemWidth,
      child: FlatButton(
        //TODO TextButton
        onPressed: onPressed,
        color: isSelected ? theme.colorScheme.primary : Colors.transparent,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusMedium),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weekDay,
              style: isSelected
                  ? weekDayStyle.copyWith(color: theme.colorScheme.onPrimary)
                  : weekDayStyle,
            ),
            Text(
              day,
              style: isSelected
                  ? dayStyle
                  : dayStyle.copyWith(color: theme.colorScheme.onSurface),
            ),
          ],
        ),
      ),
    );
  }
}
