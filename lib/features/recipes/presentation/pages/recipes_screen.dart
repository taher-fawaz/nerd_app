import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app/features/recipes/presentation/bloc/recipes_bloc.dart';

import '../widgets/recipe_tile.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<RecipesBloc>(context).add(const GetRecipesEvent());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: BlocBuilder<RecipesBloc, RecipesState>(
                builder: (context, state) {
              return ListView.builder(
                  itemCount: state.recipes.length,
                  itemBuilder: (context, index) {
                    return RecipeTile(
                      recipe: state.recipes[index],
                    );
                  });
            }),
          ),
        ),
      ],
    );
  }
}
