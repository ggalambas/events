import 'package:events/ui/components/customAppBar.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          CustomAppBar(),
          SliverList(delegate: SliverChildBuilderDelegate((_, index) {
            if (index < concelhos.length)
              return Container(
                height: 100,
                child: Text(concelhos[index]),
              );
          }))
        ],
      ),
    );
  }
}
