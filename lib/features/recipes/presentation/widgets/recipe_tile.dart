import 'package:app/core/resources/color_manager.dart';
import 'package:app/features/recipes/domain/entities/recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/navigation/navigator.dart';
import '../../../../core/resources/routes_manager.dart';

class RecipeTile extends StatelessWidget {
  final Recipe recipe;
  const RecipeTile({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CustomNavigator.push(Routes.recipesDetailsRoute, arguments: {
          "data": recipe,
        });
      },
      child: Container(
        height: 90,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: ColorManager.greyTextColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // Recipe Photo
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ColorManager.darkPrimary,
                image: DecorationImage(
                    image: NetworkImage(recipe.image), fit: BoxFit.cover),
              ),
            ),
            // Recipe Info
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Recipe title
                    Container(
                      margin: EdgeInsets.only(bottom: 12),
                      child: Text(
                        recipe.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontFamily: 'inter'),
                      ),
                    ),
                    // Recipe Calories and Time
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            recipe.calories,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.alarm,
                          size: 14,
                          color: Colors.black,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            recipe.time,
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
