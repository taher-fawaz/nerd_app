part of 'recipes_bloc.dart';

abstract class RecipesEvent extends Equatable {
  const RecipesEvent();

  @override
  List<Object> get props => [];
}

class GetRecipesEvent extends RecipesEvent {
  final bool isRefresh;
  const GetRecipesEvent({
    this.isRefresh = false,
  });
}
