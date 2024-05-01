import 'package:app/features/recipes/presentation/bloc/recipes_bloc.dart';

import '../../../injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_bloc/app_bloc.dart';

MultiBlocProvider listOfBlocProviders(Widget child) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => AppBloc()),
    ],
    child: child,
  );
}

MultiBlocProvider listOfBlocProvidersForMainScreen(Widget child) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => RecipesBloc(getIt())),
    ],
    child: child,
  );
}
