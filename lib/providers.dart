import 'package:events/app/appbar/calendar_model.dart';
import 'package:events/app/auth/auth_model.dart';
import 'package:events/app/auth/sign_in_form_model.dart';
import 'package:events/app/drawer/category_model.dart';
import 'package:events/config/injection.dart';
import 'package:events/config/theme/theme_config.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> mainProviders = [
  ChangeNotifierProvider<AuthModel>.value(
    value: getIt<AuthModel>(),
  ),
  ChangeNotifierProvider<ThemeConfig>(
    create: (_) => ThemeConfig(),
  ),
  ChangeNotifierProvider<SignInFormModel>.value(
    value: getIt<SignInFormModel>(),
  ),
];

List<SingleChildWidget> userProviders = [
  ChangeNotifierProvider<CalendarModel>.value(
    value: getIt<CalendarModel>(),
  ),
  ChangeNotifierProvider<CategoryModel>.value(
    value: getIt<CategoryModel>(),
  ),
];
