import 'package:events/config/constants.dart';
import 'package:events/domain/core/event_counter.dart';
import 'package:flutter/material.dart';

class Counters extends StatelessWidget {
  final EventCounter counter;
  final bool selected;

  const Counters(this.counter, {this.selected = false});

  int get live => counter.live;
  int get total => counter.total;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (live != 0) Counter(live, live: true, selected: selected),
        if (total != 0) Counter(total, selected: selected),
      ],
    );
  }
}

class Counter extends StatelessWidget {
  final int counter;
  final bool live;
  final bool selected;

  const Counter(this.counter, {this.live = false, this.selected});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      margin: live ? EdgeInsets.only(right: 5.0) : EdgeInsets.zero,
      padding: EdgeInsets.symmetric(horizontal: kCounterHorizPadding),
      constraints: BoxConstraints(minWidth: kCounterSize),
      height: kCounterSize,
      decoration: BoxDecoration(
        color: selected
            ? Colors.transparent
            : live
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
