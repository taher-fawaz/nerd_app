import 'package:app/features/recipes/domain/entities/recipe.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/network/failure.dart';
import '../../../../core/params/no_params.dart';
import '../../../../core/uscecase/usecase.dart';
import '../repositories/recipes_repository.dart';

class GetRecipesUseCase
    extends UseCase<Either<Failure, List<Recipe>>, NoParams?> {
  final IRecipesRepository repository;
  GetRecipesUseCase(this.repository);
  @override
  Future<Either<Failure, List<Recipe>>> call({NoParams? p}) async {
    final res = await repository.getRecipes();
    return res;
  }
}
