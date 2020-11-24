import 'package:auto_route/auto_route_annotations.dart';
import 'package:events/ui/regions_view.dart';

//* ExtendedNavigator.root.pushHome
//* flutter pub run build_runner watch --delete-conflicting-outputs

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: [
    MaterialRoute(page: RegionsView, initial: true),
    // MaterialRoute(page: Events),
    // MaterialRoute(page: EventInfo),
    // MaterialRoute(page: SignInPage),
  ],
)
class $ARouter {}
