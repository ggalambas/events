import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';

class SwipeUp extends StatefulWidget {
  final String text;
  final void Function() onSwipe;

  const SwipeUp(this.text, {this.onSwipe});

  @override
  _SwipeUpState createState() => _SwipeUpState();
}

class _SwipeUpState extends State<SwipeUp> {
  bool _swipe = true;
  bool get swipe => _swipe;
  set swipe(bool swiping) => setState(() => _swipe = swiping);

  double _swipeOffset = 0;
  double get swipeOffset => _swipeOffset;
  set swipeOffset(double offset) => setState(() => _swipeOffset = offset);

  double _initialOffset = 0;
  double get initialOffset => _initialOffset;
  set initialOffset(double offset) => setState(() => _initialOffset = offset);

  double get maxSwipeOffset => 20.0;
  double multiplier(double offset) =>
      maxSwipeOffset *
      Curves.easeOutCubic
          .transformInternal(offset / MediaQuery.of(context).size.height);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onVerticalDragStart: (details) {
        initialOffset = details.globalPosition.dy;
      },
      onVerticalDragUpdate: (details) {
        final double offset = initialOffset - details.globalPosition.dy;
        if (offset > 0 && multiplier(offset) < maxSwipeOffset) {
          swipeOffset = multiplier(offset);
        }
      },
      onVerticalDragEnd: (details) {
        if (swipeOffset > 0.4 * maxSwipeOffset) widget.onSwipe();
        swipeOffset = 0;
      },
      onTap: () {
        swipe = false;
        swipeOffset = maxSwipeOffset;
        widget.onSwipe();
        Future.delayed(kAnimationDuration * 2, () {
          swipeOffset = 0;
          swipe = true;
        });
      },
      child: AnimatedContainer(
        height: kSwipeUpHeight,
        padding: EdgeInsets.only(bottom: kSwipeUpPadding + swipeOffset),
        color: Colors.transparent,
        curve: Curves.easeOutCubic,
        duration: swipe ? Duration.zero : kAnimationDuration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.keyboard_arrow_up),
            Text(
              widget.text,
              style: theme.textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
