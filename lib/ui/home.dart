import 'package:events/ui/components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:events/app/scroll_model.dart';
import 'package:provider/provider.dart';

List<String> concelhos = [
  'Mafra',
  'Loures',
  'Sintra',
  'Torres Vedras',
  'Abrantes',
  'Águeda',
  'Aguiar da Beira',
  'Alandroal',
  'Albergaria-a-Velha',
  'Albufeira',
  'Alcácer do Sal',
  'Alcanena'
];

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScrollModel scroll = Provider.of<ScrollModel>(context, listen: false);
    return Scaffold(
      drawer: Drawer(),
      body: NotificationListener<ScrollEndNotification>(
        onNotification: (_) {
          scroll.snapFlexbar();
          return false;
        },
        child: CustomScrollView(
          controller: scroll.controller,
          slivers: <Widget>[
            CustomAppBar(
              title: 'Categoria', //!
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, index) {
                  return SizedBox(
                    height: 100,
                    child: Text(concelhos[index]),
                  );
                },
                childCount: concelhos.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
