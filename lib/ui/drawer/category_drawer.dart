import 'package:events/app/drawer/category_model.dart';
import 'package:events/domain/categories/category.dart';
import 'package:events/ui/body/components/list_subtitle.dart';
import 'package:events/ui/drawer/components/category_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final CategoryModel model = Provider.of<CategoryModel>(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(), // To appear under the status bar
        children: [
          UserAccountsDrawerHeader(
            //TODO: Auth
            accountEmail: Text('galambas@gmail.com'),
            accountName: Text('galambas'),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryVariant,
            ),
          ),
          // TODO: Selected category color
          model.load.map(
            // TODO: data loading
            inProgress: Text('Loading'),
            success: Column(
              children: [
                // TODO: Auth: bookmark tab
                // CategoryItem(
                //   'Guardados',
                //   liveEvents: 17,
                //   totalEvents: 58,
                // ),
                // TODO: Location: favorites
                // ListSubtitle('Favoritos'),
                ListSubtitle('Outras Categorias'),
                for (Category category in model.categories)
                  CategoryItem(category),
              ],
            ),
            // TODO: data failure
            failure: Text('Failure'),
          ),
        ],
      ),
    );
  }
}
