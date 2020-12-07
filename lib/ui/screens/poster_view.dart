import 'package:events/config/constants.dart';
import 'package:events/domain/events/event.dart';
import 'package:flutter/material.dart';
import 'package:events/app/helpers/date_time_x.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

class PosterView extends StatefulWidget {
  final Event event;

  const PosterView({this.event});

  @override
  _PosterViewState createState() => _PosterViewState();
}

class _PosterViewState extends State<PosterView> {
  // String get name => widget.event.name.getOrCrash();
  // String get posterURL => widget.event.poster.getOrCrash().path;
  // String get url => widget.event.link.getOrCrash();
  //! - - - - - - - - - - - - - - !
  String get name => 'Aladdin';
  String get posterURL =>
      'https://br.web.img3.acsta.net/pictures/18/10/11/11/47/0874456.jpg';
  String get url => 'https://pt.wikipedia.org/wiki/Aladdin_(filme_de_2019)';
  //! - - - - - - - - - - - - - - !

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
          image: NetworkImage(
            // TODO: Loading time
            posterURL,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: AnimatedOpacity(
        opacity: longPressing ? 0 : 1,
        // TODO: Create variable for default animation duration
        duration: Duration(milliseconds: 200),
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
                    onPressed: () {}, // TODO: Bookmark, save and change icon
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          body: GestureDetector(
            // TODO: make LongPress properly remove systemUIOverlays
            onLongPressStart: (_) {
              longPressing = true;
              // SystemChrome.setEnabledSystemUIOverlays([]);
            },
            onLongPressEnd: (_) {
              longPressing = false;
              // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: RaisedButton(
            // TODO: Know more can't be clicked multiple times
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
                debugPrint(e.toString()); //!
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
