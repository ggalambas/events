import 'package:events/app/auth/overview_model.dart';
import 'package:events/app/drawer/category_model.dart';
import 'package:events/config/constants.dart';
import 'package:events/domain/categories/category.dart';
import 'package:events/ui/overview/components/page_item.dart';
import 'package:events/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategorySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final overview = Provider.of<OverviewModel>(context);
    final model = Provider.of<CategoryModel>(context);
    return PageItem(
      title: 'Categorias',
      subtitle: 'Seleciona as tuas categorias favoritas',
      child: model.load.map(
        inProgress: Loading.circular(),
        failure: Text('Failure'), //TODO: failure
        success: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 5 / 3,
          mainAxisSpacing: kOverviewSpacing,
          crossAxisSpacing: kOverviewSpacing,
          padding: EdgeInsets.all(kOverviewSpacing),
          children: [
            for (Category category in model.categories)
              GestureDetector(
                onTap: () => overview.toggleCategory(category.id),
                child: Container(
                  decoration: BoxDecoration(
                    color: overview.hasCategory(category.id)
                        ? theme.colorScheme.primary
                        : null,
                    borderRadius: BorderRadius.circular(kBorderRadiusBig),
                    border: Border.all(
                      color: overview.hasCategory(category.id)
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onBackground,
                      width: 0,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        category.icon,
                        color: overview.hasCategory(category.id)
                            ? theme.colorScheme.onPrimary
                            : theme.colorScheme.onSurface,
                      ),
                      SizedBox(height: kOverviewSpacing / 2),
                      Text(
                        category.name,
                        style: overview.hasCategory(category.id)
                            ? theme.textTheme.bodyText2
                                .copyWith(color: theme.colorScheme.onPrimary)
                            : theme.textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
