import 'dart:io';

import 'package:events/domain/core/value_objects.dart';
import 'package:events/domain/events/event.dart';
import 'package:events/domain/events/value_objects.dart';
import 'package:events/ui/body/components/event_item.dart';
import 'package:events/ui/body/components/list_group.dart';
import 'package:events/ui/body/components/list_subtitle.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

// TODO
//* 1. Voice Search

class EventSearch extends SearchDelegate {
  final BuildContext context; //!
  EventSearch({this.context});

  List<Event> events = List.generate(
    20,
    (i) => Event(
      id: UniqueId.fromUniqueString('$i'),
      name: EventName(faker.lorem.words(3).join(' ')),
      date: DateTime(
          2020,
          12,
          i < 5
              ? 8
              : i < 10
                  ? 9
                  : 10),
      link: EventLink(
        'https://pt.wikipedia.org/wiki/Aladdin_(filme_de_2019)',
      ),
      regionId: '$i',
      subregionId: '$i',
      categoryId: '$i',
      poster: Poster(
        File(
          'https://br.web.img3.acsta.net/pictures/18/10/11/11/47/0874456.jpg',
        ),
      ),
      ownerId: UniqueId.fromUniqueString('owner$i'),
    ),
  );
  static final List<Event> recents = [];
  Event selected;

  ThemeData get theme => Theme.of(context);

  @override
  String get searchFieldLabel => 'Procurar';

  @override
  TextStyle get searchFieldStyle =>
      theme.textTheme.headline6.copyWith(color: theme.colorScheme.onBackground);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return theme.copyWith(
      primaryColor: theme.appBarTheme.color,
      primaryIconTheme: theme.appBarTheme.iconTheme,
      primaryColorBrightness: theme.appBarTheme.brightness,
      primaryTextTheme: theme.textTheme,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      query.isEmpty
          ? IconButton(
              icon: Icon(Icons.mic),
              onPressed: () {}, //! 1
            )
          : IconButton(
              icon: Icon(Icons.clear),
              onPressed: () => query = '',
            ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Event> suggestions = [];
    if (query.isEmpty) {
      suggestions = recents;
      return SizedBox();
    }
    suggestions.addAll(
      events.where(
        (event) => event.name.getOrCrash().contains(query),
      ),
    );
    return suggestions.isEmpty
        ? SizedBox()
        : ListView(
            children: getSuggestions(suggestions),
          );
  }

  List<Widget> getSuggestions(List<Event> suggestions) {
    final List<Widget> list = [];
    List<Widget> events = [];
    int day = suggestions[0].date.day;
    for (final Event event in suggestions) {
      if (event.date.day != day) {
        list.add(ListSubtitle('$day Dezembro'));
        day++;
        list.add(ListGroup(items: events));
        events = [];
      }
      events.add(EventItem(event));
    }
    list.add(ListSubtitle('$day Dezembro'));
    list.add(ListGroup(items: events));
    return list;
  }
}
