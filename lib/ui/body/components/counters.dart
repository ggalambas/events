import 'package:events/config/constants.dart';
import 'package:events/domain/core/event_counter.dart';
import 'package:flutter/material.dart';

class Counters extends StatelessWidget {
  final EventCounter counter;

  const Counters(this.counter);

  int get live => counter.live;
  int get total => counter.total;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (live != 0) Counter(live, live: true),
        Counter(total),
      ],
    );
  }
}

class Counter extends StatelessWidget {
  final int counter;
  final bool live;

  const Counter(this.counter, {this.live = false});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      margin: live ? EdgeInsets.only(right: 5.0) : EdgeInsets.zero,
      padding: EdgeInsets.symmetric(horizontal: 3), //!
      constraints: BoxConstraints(minWidth: kCounterSize),
      height: kCounterSize,
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
