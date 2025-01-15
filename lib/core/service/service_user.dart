import 'package:balm_test/features/auth/data/user_cache.dart';
import 'package:balm_test/features/auth/data/user_remote_data_source.dart';
import 'package:balm_test/features/auth/data/user_repository_impl.dart';
import 'package:balm_test/features/auth/domain/user_repository.dart';
import 'package:balm_test/features/auth/domain/user_use_case.dart';
import 'package:balm_test/features/auth/presentation/bloc/user_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupServiceUsers() async {
  final dio = Dio();

  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource());

  getIt.registerLazySingleton<UserCache>(
      () => UserCache(getIt<SharedPreferences>()));

  getIt.registerLazySingleton<UserRepositoryImpl>(() => UserRepositoryImpl(
        remoteDataSource: getIt<RemoteDataSource>(),
      ));

  getIt.registerLazySingleton<FetchAllUsers>(
      () => FetchAllUsers(repository: getIt<UserRepositoryImpl>()));

  getIt.registerFactory(() => UserBloc(fetchAllUsers: getIt<FetchAllUsers>()));
}
