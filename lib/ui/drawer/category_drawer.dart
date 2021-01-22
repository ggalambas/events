import 'package:events/app/drawer/category_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:events/config/constants.dart';
import 'package:events/config/routes/router.gr.dart';
import 'package:events/domain/auth/user.dart';
import 'package:events/domain/categories/category.dart';
import 'package:events/ui/body/components/list_subtitle.dart';
import 'package:events/ui/drawer/components/category_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryDrawer extends StatelessWidget {
  //TODO
  //* 0. Give categories a name and icon
  //* 1. Header
  //* 2. bookmarks
  //* 3. Favorite Categories
  //*    If theres no favorites, change 'other categories' to 'categories'
  //* 4. Counters are just for today's day
  //* 5. select initial category

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final CategoryModel drawer = Provider.of<CategoryModel>(context);
    final User user = Provider.of<User>(context);
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            //! 1
            accountEmail:
                Text(user.email.getOrCrash(), style: theme.textTheme.bodyText1),
            accountName: Text(user.name, style: theme.textTheme.bodyText2),
            currentAccountPicture: Container(color: theme.colorScheme.primary),
            otherAccountsPictures: [
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () =>
                    ExtendedNavigator.of(context).pushSettingsScreen(),
              ),
            ],
            onDetailsPressed: () {},
            decoration: BoxDecoration(color: theme.colorScheme.surface),
            margin: EdgeInsets.zero,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: kDrawerPadding),
              children: [
                drawer.load.map(
                  inProgress: Text('Loading'), //TODO: loading
                  success: Column(
                    children: [
                      //! 2
                      // CategoryItem(
                      //   'Guardados',
                      //   liveEvents: 17,
                      //   totalEvents: 58,
                      // ),
                      //! 3
                      // ListSubtitle('Favoritos'),
                      ListSubtitle('Categorias'),
                      for (Category category in drawer.categories)
                        CategoryItem(category),
                    ],
                  ),
                  failure: Text('Failure'), //TODO: failure
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
