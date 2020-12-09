import 'package:events/populate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:events/app/appbar/scroll_model.dart';
import 'package:sliver_tools/sliver_tools.dart';

class SliverScaffold extends StatelessWidget {
  final Widget drawer;
  final Widget appbar;
  final Widget body;

  const SliverScaffold({
    this.drawer,
    @required this.appbar,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ScrollModel>(
      create: (_) => ScrollModel(),
      builder: (context, _) {
        final ScrollModel scroll =
            Provider.of<ScrollModel>(context, listen: false);
        final double screenSize = MediaQuery.of(context).size.height;
        final double statusBarHeight = MediaQuery.of(context).padding.top;
        return Scaffold(
          drawer: drawer,
          body: NotificationListener<ScrollEndNotification>(
            onNotification: (_) {
              scroll.snapFlexbar();
              return false;
            },
            child: CustomScrollView(
              controller: scroll.controller,
              slivers: <Widget>[
                appbar,
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
          // floatingActionButton: FloatingActionButton(onPressed: populate), //! button to populate
        );
      },
    );
  }
}
