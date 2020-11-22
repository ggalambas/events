import 'package:auto_route/auto_route_annotations.dart';
import 'package:events/ui/home.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: [
    MaterialRoute(page: Home, initial: true),
    // MaterialRoute(page: SignInPage),
  ],
)
class $ARouter {}
