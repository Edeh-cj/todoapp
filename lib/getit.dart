import 'repository/repo_.dart';
import 'package:get_it/get_it.dart';
import 'services/repoimpl.dart';

GetIt locator = GetIt.I;
initLocator() {
  locator.registerLazySingleton<Repository>(() => RepoImpl());
}