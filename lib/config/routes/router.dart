import 'package:auto_route/auto_route_annotations.dart';
import 'package:events/ui/events_view.dart';
import 'package:events/ui/regions_view.dart';
import 'package:events/ui/splash_screen.dart';

//* ExtendedNavigator.root.pushHome
//* flutter pub run build_runner watch --delete-conflicting-outputs

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: [
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: RegionsView),
    MaterialRoute(page: EventsView),
  ],
)
class $Router {}
