import 'dart:ui';
import 'package:events/app/helpers/awesome_icon.dart';
import 'package:events/config/constants.dart';
import 'package:events/domain/events/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//TODO
//* 1. Bookmark
//* 2. Share
//* 3. Buttons shouldn't be able to be clicked multiple times
//* 4. custom tabs

class PosterScreen extends StatelessWidget {
  final Event event;

  const PosterScreen({this.event});

  String get name => event.name.getOrCrash();
  String get posterURL => event.poster.getOrCrash().path;
  String get url => event.link.getOrCrash();

  Future _launch(String url) async {
    //! 4
    try {
      await launch(
        url,
        option: CustomTabsOption(
          enableUrlBarHiding: true,
          showPageTitle: true,
          animation: CustomTabsAnimation.slideIn(),
          extraCustomTabs: <String>[
            'org.mozilla.firefox',
            'com.microsoft.emmx'
          ],
        ),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString()); //! review this
    }
  }

  @override
  Widget build(BuildContext context) {
    const double appBarBorderRadius = kBorderRadiusBig;
    final ThemeData theme = Theme.of(context);
    return Stack(
      children: [
        SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: kToolbarHeight - appBarBorderRadius),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(posterURL),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(appBarBorderRadius),
              ),
            ),
            title: Text(name, style: theme.textTheme.bodyText1),
            actions: [
              IconButton(
                icon: Icon(Icons.bookmark_border),
                onPressed: () {
                  //! 1
                },
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterFloat,
          floatingActionButton: Row(
            children: [
              Spacer(),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(kBorderRadiusBig),
                ),
                color: theme.colorScheme.surface,
                onPressed: () => _launch(url),
                child: Text('Saber mais'),
              ),
              SizedBox(width: 8),
              PosterFAB(
                icon: AwesomeIcon(FontAwesomeIcons.share),
                onPressed: () {
                  //! 2
                },
              ),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}

class PosterFAB extends StatelessWidget {
  final Widget icon;
  final void Function() onPressed;
  final Color color;

  const PosterFAB({@required this.icon, @required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kPosterFABPadding),
      child: FloatingActionButton(
        heroTag: null,
        mini: true,
        backgroundColor: color ?? colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        onPressed: onPressed,
        child: icon,
      ),
    );
  }
}
