import 'package:get_it/get_it.dart';
import 'package:zadanie_rekrutacyjne/number_service.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => NumberService());
}
