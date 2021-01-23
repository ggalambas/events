import 'package:events/app/appbar/calendar_model.dart';
import 'package:events/app/appbar/calendar_scroll_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:events/app/appbar/scroll_model.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:events/app/helpers/scaffold_x.dart';

class SliverScaffold extends StatelessWidget {
  final Widget drawer;
  final Widget appBar;
  final Widget body;
  final bool appBarCollapsed;

  const SliverScaffold({
    this.drawer,
    @required this.appBar,
    this.body,
    this.appBarCollapsed = false,
  });

  //TODO:
  //* create Event

  @override
  Widget build(BuildContext context) {
    final double screenSize = MediaQuery.of(context).size.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final CalendarModel calendar =
        Provider.of<CalendarModel>(context, listen: false);

    return MultiProvider(
      providers: [
        Provider<CalendarScrollModel>(
            create: (_) => CalendarScrollModel(calendar)),
        ChangeNotifierProvider<ScrollModel>(
          create: (_) => ScrollModel(),
        ),
      ],
      builder: (context, _) {
        final CalendarScrollModel calendarScroll =
            Provider.of<CalendarScrollModel>(context, listen: false);
        final ScrollModel scroll =
            Provider.of<ScrollModel>(context, listen: false);
        calendarScroll.snapSelected();
        if (appBarCollapsed) scroll.hardCollapseFlexBar();
        return Scaffold(
          drawer: drawer,
          body: NotificationListener<ScrollEndNotification>(
            onNotification: (_) {
              scroll.snapFlexbar();
              if (scroll.isFlexbarCollapsed) {
                calendarScroll.snapSelected();
              }
              return false;
            },
            child: CustomScrollView(
              controller: scroll.controller,
              slivers: <Widget>[
                appBar,
                SliverStack(
                  children: [
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: screenSize - kToolbarHeight - statusBarHeight,
                      ),
                    ),
                    body,
                  ],
                ),
              ],
            ),
          ),
          //!
          floatingActionButton: FloatingActionButton(
            onPressed: () => print('Create Event'),
            child: Icon(Icons.add),
          ),
        ).rounded(context);
      },
    );
  }
}
