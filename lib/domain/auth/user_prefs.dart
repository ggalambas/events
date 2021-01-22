import 'package:flutter/foundation.dart';

class UserPrefs {
  Map<int, String> categories;
  String region;

  UserPrefs({
    @required categories,
    @required region,
  });
}
