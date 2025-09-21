import 'package:get_it/get_it.dart';
import 'package:modak/services/camping_service.dart';
import 'package:modak/services/journal_service.dart';
import 'package:modak/viewmodels/home_viewmodel.dart';
import 'package:modak/viewmodels/journal_viewmodel.dart';
import 'package:modak/viewmodels/main_viewmodel.dart';
import 'package:modak/viewmodels/map_viewmodel.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Services
  getIt.registerLazySingleton<CampingService>(() => CampingServiceImpl());
  getIt.registerLazySingleton<JournalService>(() => JournalServiceImpl());

  // ViewModels
  getIt.registerFactory(() => HomeViewModel(
        campingService: getIt<CampingService>(),
        journalService: getIt<JournalService>(),
      ));
  getIt.registerFactory(() => JournalViewModel(
        journalService: getIt<JournalService>(),
      ));
  getIt.registerFactory(() => MainViewModel());
  getIt.registerFactory(() => MapViewModel(
        campingService: getIt<CampingService>(),
      ));
}