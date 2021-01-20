import 'package:dots_indicator/dots_indicator.dart';
import 'package:events/config/constants.dart';
import 'package:events/ui/overview/category_selector.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final PageController pageController = PageController();

    final List<Widget> _pages = [
      CategorySelector(),
      CategorySelector(),
      CategorySelector(),
    ];

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kBorderRadiusBig),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kBorderRadiusBig),
                  child: PageView(
                    controller: pageController,
                    children: _pages,
                  ),
                ),
              ),
              //! Extract this widget with name 'PageIndicator' when fully done
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: kOverviewVertPadding / 2),
                child: DotsIndicator(
                  decorator: DotsDecorator(
                    color: theme.colorScheme.background,
                    activeColor: theme.colorScheme.primary,
                    spacing: EdgeInsets.all(4),
                  ),
                  position: 0,
                  dotsCount: _pages.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
