import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';

class ListGroup extends StatelessWidget {
  final List<Widget> _itemsWithDivider = [];
  final bool first;

  ListGroup({List<Widget> items, this.first = false}) {
    if (items.isNotEmpty) {
      for (final Widget item in items) {
        _itemsWithDivider..add(item)..add(const Divider());
      }
      _itemsWithDivider.removeLast();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: first
            ? BorderRadius.vertical(bottom: Radius.circular(kBorderRadiusBig))
            : BorderRadius.circular(kBorderRadiusBig),
      ),
      child: Column(
        children: _itemsWithDivider,
      ),
    );
  }
}
