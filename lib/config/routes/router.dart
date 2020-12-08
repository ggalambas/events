import 'package:auto_route/auto_route_annotations.dart';
import 'package:events/ui/screens/events_screen.dart';
import 'package:events/ui/screens/login_screen.dart';
import 'package:events/ui/screens/poster_screen.dart';
import 'package:events/ui/screens/regions_screen.dart';
import 'package:events/ui/screens/register_screen.dart';

//* ExtendedNavigator.root.pushHome
//* flutter pub run build_runner watch --delete-conflicting-outputs

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: [
    MaterialRoute(page: LoginScreen),
    MaterialRoute(page: RegisterScreen),
    MaterialRoute(page: RegionsScreen, initial: true),
    MaterialRoute(page: EventsScreen),
    MaterialRoute(page: PosterScreen),
  ],
)
class $Router {}
