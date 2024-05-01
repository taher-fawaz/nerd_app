import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:app/core/config/app_env.dart';
import 'package:app/core/network/api_config_rest.dart';
import 'package:app/core/network/nerd_rest.dart';
import 'package:app/features/recipes/data/datasources/recipes_remote_datasource.dart';
import 'package:app/features/recipes/data/repositories/recipes_repository_impl.dart';
import 'package:app/features/recipes/domain/repositories/recipes_repository.dart';
import 'package:app/features/recipes/domain/usecases/recipes_usecase.dart';
import 'package:realm/realm.dart';

import 'core/blocs/bloc_config/bloc_providers.dart';

final GetIt getIt = GetIt.instance;

Widget setupDependencies({required Widget child}) => listOfBlocProviders(child);

Widget setupDependenciesMainScreen({required Widget child}) =>
    listOfBlocProvidersForMainScreen(child);

class DependencyInjectionInit {
  static final DependencyInjectionInit _singleton = DependencyInjectionInit._();

  factory DependencyInjectionInit() => _singleton;

  DependencyInjectionInit._();

  /// Register the Basic Singleton
  Future<void> registerSingletons() async {
    getIt.registerLazySingleton(() => appEnv);

    /// register Dio Package
    getIt.registerLazySingleton(() => Dio());

    getIt.registerLazySingleton(() => Dio(), instanceName: "apiConfig");

    getIt.registerLazySingleton(() => Dio(), instanceName: "nerdDio");

    final apiConfig =
        ApiConfigRest(getIt.call(instanceName: "apiConfig"), enableLog: true);

    final nerdRest =
        NerdRest(getIt.call(instanceName: "nerdDio"), appEnv, enableLog: true);

    getIt.registerLazySingleton(() => apiConfig);
    getIt.registerLazySingleton(() => nerdRest);

    getIt.registerLazySingleton(() => Connectivity());

    final getRecipesUseCase = _initGetRecipesUseCase(nerdRest);
    getIt.registerLazySingleton(() => getRecipesUseCase);
  }
}

GetRecipesUseCase _initGetRecipesUseCase(NerdRest nerdRest) {
  IRecipesRemoteDataSource postDataSource;
  IRecipesRepository postRepository;

  postDataSource = RecipesRemoteDataSourceImpl(nerdRest);

  // init repositories
  postRepository = RecipesRepositoryImpl(remoteDataSource: postDataSource);
  // use cases
  return GetRecipesUseCase(postRepository);
}
