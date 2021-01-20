import 'package:events/config/constants.dart';
import 'package:events/ui/overview/components/page_item.dart';
import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return PageItem(
      title: 'Categorias',
      subtitle: 'Seleciona as tuas categorias favoritas',
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 5 / 3,
        mainAxisSpacing: kGridSpacing,
        crossAxisSpacing: kGridSpacing,
        padding: EdgeInsets.all(kGridSpacing),
        children: List.generate(
          15,
          (i) => GestureDetector(
            onTap: () {}, //! change card color
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kBorderRadiusBig),
                border: Border.all(
                  color: theme.colorScheme.onBackground,
                  width: 0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.style),
                  Text('Category ${i + 1}', style: theme.textTheme.bodyText1),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
