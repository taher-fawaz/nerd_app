part of 'recipes_bloc.dart';

class RecipesState extends Equatable {
  final RequestStatus status;
  final List<Recipe> recipes;
  final String errorMessage;

  const RecipesState({
    this.recipes = const [],
    this.status = RequestStatus.loading,
    this.errorMessage = '',
  });
  RecipesState copyWith({
    RequestStatus? status,
    List<Recipe>? recipes,
    String? errorMessage,
  }) {
    return RecipesState(
      recipes: recipes ?? this.recipes,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        status,
        recipes,
        errorMessage,
      ];
}
