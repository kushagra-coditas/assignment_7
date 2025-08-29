// import 'package:assignment_6/data/datasources/remote/remote_data_sources.dart';
// import 'package:assignment_6/domain/repository/repository.dart';
// import 'package:assignment_6/domain/usecase/fetch_food_usecase.dart';
// import 'package:assignment_6/features/home/providers/home_notifier.dart';
// import 'package:get_it/get_it.dart';

// final getIt = GetIt.instance;

// void setup() {
//   getIt.registerLazySingleton<RemoteDataSources>(
//     () => RemoteDataSources(),
//   );
//   getIt.registerLazySingleton<Repository>(
//     () => Repository(),
//   );
//   getIt.registerLazySingleton<Usecase>(
//     () => Usecase(repository: Repository()),
//   );
//   getIt.registerLazySingleton<HomeNotifier>(
//     () => HomeNotifier(Usecase(repository: Repository())),
//   );
// }