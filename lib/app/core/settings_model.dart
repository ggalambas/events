import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class SettingsModel extends ChangeNotifier {
  final SharedPreferences _prefs;

  SettingsModel(this._prefs);

  // set value
  // _prefs.setString('name', "abc");
  // get value
  // _prefs.getString('name');
  // delete value
  // _prefs.remove('name');

}

@module
abstract class SettingsInjectableModule {
  @lazySingleton
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
