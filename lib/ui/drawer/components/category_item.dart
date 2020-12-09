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
    final bool isSelected = model.isSelected(category);
    final BorderRadius borderRadius = BorderRadius.horizontal(
      right: Radius.circular(kBorderRadiusMedium),
    );
    return Padding(
      padding: EdgeInsets.only(right: kDrawerPadding),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
          dense: true,
          onTap: () {
            model.selected = category;
            Navigator.pop(context);
          },
          selected: isSelected,
          leading: Icon(
            icon,
            color: !isSelected
                ? theme.colorScheme.onBackground
                : theme.colorScheme.primary,
          ),
          title: Text(
            name,
            style: !isSelected
                ? theme.textTheme.bodyText1
                : theme.textTheme.bodyText2.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
          ),
          trailing: Counters(counter, selected: isSelected),
          selectedTileColor:
              theme.colorScheme.primary.withOpacity(kPrimaryOpacity),
        ),
      ),
    );
  }
}
