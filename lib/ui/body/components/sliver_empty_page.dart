import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';

class SliverEmptyPage extends StatelessWidget {
  final IconData icon;
  final String message;

  const SliverEmptyPage({this.icon, this.message});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final double screenWidth = MediaQuery.of(context).size.width;
    return SliverFillRemaining(
        hasScrollBody: false,
        child: Padding(
          padding: EdgeInsets.all(screenWidth * kEmptyPaddingRatio),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: kEmptyIconSize),
              SizedBox(height: kEmptySpacerHeight),
              Text(
                message,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyText1,
              ),
            ],
          ),
        ));
  }
}
