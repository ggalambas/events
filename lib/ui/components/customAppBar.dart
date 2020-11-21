import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
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
        Container(
          margin: EdgeInsets.only(right: 19),
          width: 60,
          padding: EdgeInsets.symmetric(vertical: 13),
          child: Material(
            borderRadius: BorderRadius.circular(15),
            color: Colors.deepPurpleAccent.withOpacity(0.1),
            child: InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                print('open calendar');
              },
              child: Center(
                child: Text(
                  '21 Nov',
                  style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
      // TODO: Calendar
      // expandedHeight: 120,
      // flexibleSpace: FlexibleSpaceBar();
    );
  }
}
