import 'package:app/features/recipes/domain/entities/recipe.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/enums/request_state.dart';
import '../../../../core/network/failure.dart';
import '../../domain/usecases/recipes_usecase.dart';

part 'recipes_event.dart';
part 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  final GetRecipesUseCase getUseCase;
  int currentPageNumber = 0;
  bool hasReachedMax = false;
  bool isRefresh = false;
  RequestStatus requestStatus = RequestStatus.loading;
  RecipesBloc(this.getUseCase)
      : super(const RecipesState(
          recipes: [],
          status: RequestStatus.loading,
          errorMessage: '',
        )) {
    on<RecipesEvent>((event, emit) async {
      if (event is GetRecipesEvent) {
        final Either<Failure, List<Recipe>> response = await getUseCase();
        response.fold(
            (l) => emit(state.copyWith(
                recipes: null,
                status: RequestStatus.error,
                errorMessage: l.message)),
            (r) => emit(state.copyWith(
                  recipes: r,
                  status: RequestStatus.success,
                  errorMessage: '',
                )));
      }
    });
  }
}
