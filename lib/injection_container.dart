import 'package:clean_sample/authen/presentation/bloc/login_cubit.dart';
import 'package:get_it/get_it.dart';

import 'authen/data/data_source/authen_api.dart';
import 'authen/data/data_source/authen_data_source.dart';
import 'authen/data/repository/login_repository_impl.dart';
import 'authen/domain/repository/authen_repository.dart';
import 'authen/domain/usecase/login_usecase.dart';

final sl = GetIt.instance; // sl stands for Service Locator

Future<void> init() async {
  // Registering dependencies

  // Data Sources
  sl.registerLazySingleton<AuthenDataSource>(() => AuthenAPI());

  // Repositories
  sl.registerLazySingleton<AuthenticateRepository>(
    () => LoginRepositoryImpl(sl.get<AuthenDataSource>()),
  );

  // use cases
  sl.registerFactory(() => LoginUseCase(sl.get<AuthenticateRepository>()));

  // blocs
  sl.registerFactory(() => LoginCubit(sl.get<LoginUseCase>()));
}
