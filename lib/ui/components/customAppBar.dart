import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      leading: Icon(Icons.menu),
      title: Text(
        'Category', //!
        style: TextStyle(
          color: Color(0xFF202124), //!
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            print('search'); // TODO: Search
          },
        ),
      ],
      // TODO: Calendar
      // expandedHeight: 120,
      // flexibleSpace: FlexibleSpaceBar();
    );
  }
}
