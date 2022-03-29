import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicator extends StatelessWidget {
  final PageController controller;
  final int pages;

  const PageIndicator({
    @required this.controller,
    @required this.pages,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kOverviewVertPadding / 2),
      child: SmoothPageIndicator(
        controller: controller,
        count: pages,
        effect: ColorTransitionEffect(
          dotWidth: kIndicatorDotSize,
          dotHeight: kIndicatorDotSize,
          dotColor: theme.colorScheme.background,
          activeDotColor: theme.colorScheme.primary,
        ),
      ),
    );
  }
}
