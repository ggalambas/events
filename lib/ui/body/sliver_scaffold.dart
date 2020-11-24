import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:events/app/appbar/scroll_model.dart';

class SliverScaffold extends StatelessWidget {
  final Widget drawer;
  final Widget appbar;
  final List<Widget> body;

  const SliverScaffold({
    this.drawer,
    @required this.appbar,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    final ScrollModel scroll = Provider.of<ScrollModel>(context, listen: false);
    return Scaffold(
      drawer: drawer,
      body: NotificationListener<ScrollEndNotification>(
        onNotification: (_) {
          scroll.snapFlexbar();
          return false;
        },
        child: CustomScrollView(
          //TODO: pull to refresh
          //TODO: Scroll physics not working
          physics: AlwaysScrollableScrollPhysics(),
          // physics: BouncingScrollPhysics(),
          controller: scroll.controller,
          slivers: <Widget>[
            appbar,
            body != null
                ? SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (_, i) {
                        return body[i];
                      },
                      childCount: body.length,
                    ),
                  )
                : SliverFillRemaining(
                    hasScrollBody: false,
                    // TODO no body, child
                    child: Center(child: Text('no events')),
                  ),
          ],
        ),
      ),
    );
  }
}
