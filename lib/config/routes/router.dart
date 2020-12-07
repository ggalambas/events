import 'package:auto_route/auto_route_annotations.dart';
import 'package:events/ui/screens/events_view.dart';
import 'package:events/ui/screens/login_screen.dart';
import 'package:events/ui/screens/regions_view.dart';
import 'package:events/ui/screens/register_screen.dart';

//* ExtendedNavigator.root.pushHome
//* flutter pub run build_runner watch --delete-conflicting-outputs

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: [
    MaterialRoute(page: LoginScreen),
    MaterialRoute(page: RegisterScreen),
    MaterialRoute(page: RegionsView, initial: true),
    MaterialRoute(page: EventsView),
  ],
)
class $Router {}
