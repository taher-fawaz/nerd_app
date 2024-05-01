import 'package:app/features/recipes/domain/entities/recipe.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/network/failure.dart';

abstract class IRecipesRepository {
  Future<Either<Failure, List<Recipe>>> getRecipes();
}
