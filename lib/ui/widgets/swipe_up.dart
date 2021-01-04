import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';

class SwipeUp extends StatefulWidget {
  final Widget child;
  final void Function() onSwipe;

  const SwipeUp({this.child, this.onSwipe});

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

  double get maxSwipeOffset => 99;
  double multiplier(double offset) =>
      maxSwipeOffset *
      Curves.easeOutCubic
          .transformInternal(offset / MediaQuery.of(context).size.height);

  double get swipeOffsetGoal => maxSwipeOffset / 3;
  bool get swiped => swipeOffset > swipeOffsetGoal;

  @override
  Widget build(BuildContext context) {
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
        if (swiped) widget.onSwipe();
        swipeOffset = 0;
      },
      onTap: () {
        swipe = false;
        swipeOffset = swipeOffsetGoal;
        widget.onSwipe();
        Future.delayed(kAnimationDuration * 2, () {
          swipeOffset = 0;
          swipe = true;
        });
      },
      child: AnimatedContainer(
        height: kSwipeUpHeight,
        padding: EdgeInsets.only(bottom: kSwipeUpPadding),
        color: Colors.transparent,
        curve: Curves.easeOutCubic,
        duration: swipe ? Duration.zero : kAnimationDuration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Spacer(flex: 100 - swipeOffset.ceil()),
            Icon(Icons.keyboard_arrow_up),
            widget.child,
            Spacer(flex: 1 + swipeOffset.ceil()),
          ],
        ),
      ),
    );
  }
}
