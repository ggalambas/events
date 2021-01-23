import 'package:auto_route/auto_route_annotations.dart';
import 'package:events/ui/screens/settings/change_region_screen.dart';
import 'package:events/ui/screens/overview_screen.dart';
import 'package:events/ui/screens/auth_screen.dart';
import 'package:events/ui/screens/events_screen.dart';
import 'package:events/ui/screens/login_screen.dart';
import 'package:events/ui/screens/poster_screen.dart';
import 'package:events/ui/screens/regions_screen.dart';
import 'package:events/ui/screens/register_screen.dart';
import 'package:events/ui/screens/settings/favorite_categories_screen.dart';
import 'package:events/ui/screens/settings_screen.dart';

//* flutter pub run build_runner watch --delete-conflicting-outputs

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: [
    MaterialRoute(page: AuthScreen, initial: true),
    MaterialRoute(page: LoginScreen),
    MaterialRoute(page: RegisterScreen),
    MaterialRoute(page: OverviewScreen),
    MaterialRoute(page: RegionsScreen),
    MaterialRoute(page: EventsScreen),
    MaterialRoute(page: PosterScreen),
    MaterialRoute(page: SettingsScreen),
    MaterialRoute(page: ChangeRegionScreen),
    MaterialRoute(page: FavoriteCategoriesScreen),
  ],
)
class $Router {}
