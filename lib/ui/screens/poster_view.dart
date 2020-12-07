import 'package:events/domain/events/event.dart';
import 'package:flutter/material.dart';

class PosterView extends StatelessWidget {
  final Event event;

  const PosterView({this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.network(
        '',
      ),
    );
  }
}
