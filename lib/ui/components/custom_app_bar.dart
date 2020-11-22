import 'package:events/app/constants.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final String subtitle;

  CustomAppBar({@required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SliverAppBar(
      pinned: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(kBorderRadiusBig),
          bottomRight: Radius.circular(kBorderRadiusBig),
        ),
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: textTheme.headline6),
          if (subtitle != null) Text(subtitle, style: textTheme.bodyText2),
        ],
      ),

      //! Nothing done FROM this point

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
            borderRadius: BorderRadius.circular(10),
            color: Colors.deepPurpleAccent.withOpacity(0.1),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
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
