import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:app/features/recipes/data/models/recipe.dart';
import 'package:app/features/recipes/domain/entities/recipe.dart';
import '../../../../core/network/failure.dart';
import '../../domain/repositories/recipes_repository.dart';
import '../datasources/recipes_remote_datasource.dart';

class RecipesRepositoryImpl extends IRecipesRepository {
  final IRecipesRemoteDataSource remoteDataSource;

  RecipesRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Recipe>>> getRecipes() async {
    try {
      var response = await remoteDataSource.getRecipes();
      if (response.error == null) {
        final List<Recipe> recipesList = (response.data as List<dynamic>)
            .map((e) => RecipeModel.fromJson(e as Map<String, dynamic>))
            .toList();

        return Right(recipesList);
      } else {
        return Left(Failure(message: response.error!));
      }
    } on DioException catch (_) {
      return Left(Failure(message: "error_message"));
    }
  }
}
