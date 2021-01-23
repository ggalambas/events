import 'package:events/app/auth/overview_model.dart';
import 'package:events/config/constants.dart';
import 'package:events/domain/regions/region.dart';
import 'package:events/ui/auth/components/submit_button.dart';
import 'package:events/ui/overview/components/dropdown.dart';
import 'package:events/ui/overview/components/overview_error.dart';
import 'package:events/ui/overview/components/page_item.dart';
import 'package:flutter/material.dart' hide State;
import 'package:provider/provider.dart';

class RegionSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final overview = Provider.of<OverviewModel>(context);
    return PageItem(
      title: 'Região',
      subtitle: 'Seleciona o teu local de residência',
      child: Padding(
        padding: EdgeInsets.all(kOverviewSpacing),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Dropdown<Region>(
              hint: 'Country',
              value: overview.country,
              onChanged: (value) => overview.country = value,
              items: overview.countries,
            ),
            Dropdown<Region>(
              hint: 'Distrito',
              value: overview.state,
              onChanged: (value) => overview.state = value,
              items: overview.states.filteredBy(overview.country),
            ),
            Dropdown<Region>(
              hint: 'Concelho',
              value: overview.region,
              onChanged: (value) => overview.region = value,
              items: overview.regions.filteredBy(overview.state),
            ),
            Spacer(),
            Text(
              'Vamos usar a tua região para mostrarmos eventos perto de ti. Também poderás procurar eventos noutra região ou perto da tua localização atual!',
              style: theme.textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            SubmitButton(
              text: 'Avançar',
              onPressed: () async {
                await overview.setPrefs();
                showError(context, overview.prefsFailureOrSuccessOption);
              },
            ),
          ],
        ),
      ),
    );
  }
}
