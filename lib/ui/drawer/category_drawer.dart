import 'package:events/app/drawer/category_model.dart';
import 'package:events/domain/categories/category.dart';
import 'package:events/ui/body/components/list_subtitle.dart';
import 'package:events/ui/drawer/components/category_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryDrawer extends StatelessWidget {
  //TODO: CategoryDrawer
  //* 1. Header
  //* 2. Saved Events
  //* 3. Favorite Categories
  //* If theres no favorites, change 'other categories' to 'categories'
  //* 4. Give categories a name and icon
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final CategoryModel model = Provider.of<CategoryModel>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(), // To appear under the status bar
        children: [
          UserAccountsDrawerHeader(
            //! 1
            accountEmail: Text('galambas@gmail.com'),
            accountName: Text('galambas'),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryVariant,
            ),
          ),
          model.load.map(
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
                for (Category category in model.categories)
                  CategoryItem(category),
              ],
            ),
            failure: Text('Failure'), //TODO: failure
          ),
        ],
      ),
    );
  }
}
