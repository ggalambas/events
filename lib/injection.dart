import 'package:events/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// flutter pub run build_runner watch --delete-conflicting-outputs

final GetIt getIt = GetIt.instance;

@InjectableInit()
void configureInjection(String env) => $initGetIt(getIt, environment: env);
