import 'package:events/app/overview/overview_model.dart';
import 'package:events/config/constants.dart';
import 'package:events/config/injection.dart';
import 'package:events/ui/overview/category_selector.dart';
import 'package:events/ui/overview/components/page_indicator.dart';
import 'package:events/ui/overview/region_selector.dart';
import 'package:events/ui/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OverviewScreen extends StatelessWidget {
  //TODO:
  //* verify email screen
  //* dont show this if already shown

  final List<Widget> pages = [
    CategorySelector(),
    RegionSelector(),
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ChangeNotifierProvider.value(
      value: getIt<OverviewModel>(),
      builder: (context, _) {
        final overview = Provider.of<OverviewModel>(context);
        return Scaffold(
          backgroundColor: theme.colorScheme.surface,
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(kBorderRadiusBig),
                  child: Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(kBorderRadiusBig),
                          child: PageView(
                            controller: overview.controller,
                            children: pages,
                          ),
                        ),
                      ),
                      PageIndicator(
                        controller: overview.controller,
                        pages: pages.length,
                      ),
                    ],
                  ),
                ),
                Loading.linear(isLoading: overview.isSubmitting),
              ],
            ),
          ),
        );
      },
    );
  }
}
