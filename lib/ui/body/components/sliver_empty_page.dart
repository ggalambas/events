import 'package:flutter/material.dart';

//TODO
//* hardcoded values

class SliverEmptyPage extends StatelessWidget {
  final IconData icon;
  final String message;

  const SliverEmptyPage({this.icon, this.message});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return SliverFillRemaining(
        hasScrollBody: false,
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width / 4), //!
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 45), //!
              SizedBox(height: 15), //!
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
