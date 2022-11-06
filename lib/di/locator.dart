import 'package:get_it/get_it.dart';
import 'package:pshowcaser/services/navigation_service.dart';

var locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
