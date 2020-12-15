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

  @override
  Widget build(BuildContext context) {
    const double appBarBorderRadius = kBorderRadiusBig;
    final TextTheme textTheme = Theme.of(context).textTheme;
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
            title: Text(name, style: textTheme.bodyText1),
            actions: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PosterFAB(
                icon: AwesomeIcon(FontAwesomeIcons.info),
                onPressed: () async {
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
                },
              ),
              PosterFAB(
                icon: AwesomeIcon(FontAwesomeIcons.share),
                onPressed: () {
                  //! 2
                },
              ),
              PosterFAB(
                icon: Icon(Icons.bookmark_border),
                onPressed: () {
                  //! 1
                },
              ),
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

  const PosterFAB({@required this.icon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kPosterFABPadding),
      child: FloatingActionButton(
        heroTag: null,
        // mini: true,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        onPressed: onPressed,
        child: icon,
      ),
    );
  }
}
