import 'dart:ui';
import 'package:events/config/constants.dart';
import 'package:events/domain/events/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

class PosterScreen extends StatefulWidget {
  final Event event;

  const PosterScreen({this.event});

  @override
  _PosterScreenState createState() => _PosterScreenState();
}

//TODO
//* 1. Bookmark
//* 3. Make LongPress properly remove systemUIOverlays
//* 4. Know more shouldn't be able to be clicked multiple times

class _PosterScreenState extends State<PosterScreen> {
  String get name => widget.event.name.getOrCrash();
  String get posterURL => widget.event.poster.getOrCrash().path;
  String get url => widget.event.link.getOrCrash();

  bool _longPressing = false;
  bool get longPressing => _longPressing;
  set longPressing(bool pressing) => setState(() {
        _longPressing = pressing;
      });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(posterURL),
          fit: BoxFit.cover,
        ),
      ),
      child: AnimatedOpacity(
        opacity: longPressing ? 0 : 1,
        duration: kAnimationDuration,
        child: Scaffold(
          appBar: AppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(kBorderRadiusBig),
              ),
            ),
            title: Text(
              name,
              style: theme.textTheme.headline6,
            ),
            actions: [
              Container(
                margin: EdgeInsets.only(right: kAppBarHorizPadding),
                width: kAppBarButtonWidth,
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.bookmark_border,
                      color: theme.colorScheme.onBackground,
                    ),
                    onPressed: () {}, //! 1
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          body: GestureDetector(
            //! 3
            onLongPressStart: (_) {
              // SystemChrome.setEnabledSystemUIOverlays([]);
              longPressing = true;
            },
            onLongPressEnd: (_) {
              longPressing = false;
              // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: RaisedButton(
            //! 4
            onPressed: () async {
              try {
                await launch(
                  url,
                  option: CustomTabsOption(
                    enableUrlBarHiding: true,
                    enableDefaultShare: true,
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
            color: theme.colorScheme.surface,
            textColor: theme.colorScheme.onSurface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kBorderRadiusBig),
            ),
            child: Text('Saber mais', style: theme.textTheme.bodyText1),
          ),
        ),
      ),
    );
  }
}
