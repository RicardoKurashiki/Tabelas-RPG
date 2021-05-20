import 'package:get_it/get_it.dart';

import 'services/services.dart';

export 'package:get_it/get_it.dart';
export 'services/services.dart';

GetIt locator = GetIt.instance;

Future locatorSetup() async {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
}
