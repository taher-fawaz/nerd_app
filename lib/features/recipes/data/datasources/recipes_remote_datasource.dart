import 'package:app/core/network/nerd_rest.dart';

import '../../../../../core/network/api_response_model.dart';
import '../../../../../core/network/api_url.dart';

abstract class IRecipesRemoteDataSource {
  Future<ApiResponse> getRecipes();
}

class RecipesRemoteDataSourceImpl implements IRecipesRemoteDataSource {
  final INerdRest rest;

  RecipesRemoteDataSourceImpl(this.rest);

  @override
  Future<ApiResponse> getRecipes() async {
    final response = await rest.get(
      '${ApiURLs.baseUrl}${ApiURLs.recipesPath}',
    );
    return response;
  }
}
