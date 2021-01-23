import 'package:events/config/constants.dart';
import 'package:flutter/material.dart';

extension ScaffoldX on Scaffold {
  Container rounded(BuildContext context) => Container(
        color: Theme.of(context).colorScheme.surface,
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(kBorderRadiusBig),
          ),
          child: this,
        ),
      );
}
