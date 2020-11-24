import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';

class EventCounters extends StatelessWidget {
  final int live;
  final int total;

  const EventCounters({@required this.live, @required this.total});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (live != 0) EventCounter(live, live: true),
        EventCounter(total),
      ],
    );
  }
}

class EventCounter extends StatelessWidget {
  final int counter;
  final bool live;

  const EventCounter(this.counter, {this.live = false});

  double get size => 24.0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      margin: live ? EdgeInsets.only(right: 5.0) : EdgeInsets.zero,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: live
            ? theme.colorScheme.primary.withOpacity(kPrimaryOpacity)
            : theme.colorScheme.background,
        borderRadius: BorderRadius.circular(kBorderRadiusSmall),
      ),
      child: Center(
        child: Text(
          counter.toString(),
          style: theme.textTheme.bodyText2.copyWith(
            color: live
                ? theme.colorScheme.primary
                : theme.colorScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
