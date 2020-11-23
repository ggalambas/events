import 'package:auto_route/auto_route_annotations.dart';
import 'package:events/ui/home.dart';

// ExtendedNavigator.root.pushHome

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: [
    MaterialRoute(page: Home, initial: true),
    // MaterialRoute(page: Events),
    // MaterialRoute(page: EventInfo),
    // MaterialRoute(page: SignInPage),
  ],
)
class $ARouter {}
