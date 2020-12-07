import 'package:flutter/material.dart';

class EventSearch extends SearchDelegate {
  List<String> events = List.generate(50, (i) => 'Resultado ${i + 1}');
  String selectedResult;
  List<String> recents = ['Resultado 9', 'Resultado 2'];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(selectedResult);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = [];
    query.isEmpty
        ? suggestions = recents
        : suggestions.addAll(
            events.where(
              (event) => event.contains(query),
            ),
          );

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, i) {
        return ListTile(
          title: Text(
            suggestions[i],
          ),
        );
      },
    );
  }
}
