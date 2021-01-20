import 'package:auto_route/auto_route.dart';
import 'package:events/config/constants.dart';
import 'package:events/config/routes/router.gr.dart';
import 'package:events/ui/auth/components/submit_button.dart';
import 'package:events/ui/overview/components/dropdown.dart';
import 'package:events/ui/overview/components/page_item.dart';
import 'package:flutter/material.dart';

class RegionSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return PageItem(
      title: 'Região',
      subtitle: 'Seleciona o teu local de residência',
      child: Padding(
        padding: EdgeInsets.all(kGridSpacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Dropdown(
              hint: 'Distrito',
              items: List.generate(18, (i) => 'Distrito ${i + 1}'),
            ),
            Dropdown(
              hint: 'Concelho',
              items: List.generate(16, (i) => 'Concelho ${i + 1}'),
            ),
            Dropdown(
              hint: 'Concelho',
              items: List.generate(11, (i) => 'Freguesia ${i + 1}'),
            ),
            Spacer(),
            Text(
              'Vamos usar a tua região para mostrarmos eventos perto de ti. Também poderás procurar eventos noutra região ou perto da tua localização atual!',
              style: theme.textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            SubmitButton(
              text: 'Avançar',
              onPressed: () => ExtendedNavigator.root.pushRegionsScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
