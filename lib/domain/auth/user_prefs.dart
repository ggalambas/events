import 'package:flutter/foundation.dart';

class UserPrefs {
  List<String> categories;
  String region;
  List<String> events;

  UserPrefs({
    @required this.categories,
    @required this.region,
    @required this.events,
  });
}
