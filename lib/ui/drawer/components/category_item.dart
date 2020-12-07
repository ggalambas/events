import 'package:events/app/drawer/category_model.dart';
import 'package:events/config/constants.dart';
import 'package:events/domain/categories/category.dart';
import 'package:events/domain/core/event_counter.dart';
import 'package:events/ui/body/components/counters.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem(this.category);

  String get name => category.name;
  IconData get icon => category.icon;
  EventCounter get counter => category.eventCounter;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final CategoryModel model =
        Provider.of<CategoryModel>(context, listen: false);
    return Padding(
      padding: EdgeInsets.only(right: kDrawerRightPadding),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(kBorderRadiusMedium),
          ),
        ),
        dense: true,
        onTap: () {
          model.selected = category;
          Navigator.pop(context);
        },
        selected: model.isSelected(category), //TODO: selected color
        leading: Icon(icon, color: theme.colorScheme.onBackground),
        title: Text(name, style: theme.textTheme.bodyText1),
        trailing: Counters(counter),
      ),
    );
  }
}
