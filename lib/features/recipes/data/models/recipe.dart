//     final recipe = recipeFromJson(jsonString);

import 'dart:convert';

import '../../domain/entities/recipe.dart';

List<RecipeModel> recipeFromJson(String str) => List<RecipeModel>.from(
    json.decode(str).map((x) => RecipeModel.fromJson(x)));

class RecipeModel extends Recipe {
  const RecipeModel({
    required super.id,
    required super.fats,
    required super.name,
    required super.time,
    required super.image,
    required super.weeks,
    required super.carbos,
    required super.fibers,
    super.rating,
    required super.country,
    super.ratings,
    required super.calories,
    required super.headline,
    required super.keywords,
    required super.products,
    required super.proteins,
    required super.favorites,
    required super.difficulty,
    required super.description,
    required super.highlighted,
    required super.ingredients,
    super.incompatibilities,
    required super.deliverableIngredients,
    required super.undeliverableIngredients,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) => RecipeModel(
        id: json["id"],
        fats: json["fats"],
        name: json["name"],
        time: json["time"],
        image: json["image"],
        weeks: List<String>.from(json["weeks"].map((x) => x)),
        carbos: json["carbos"],
        fibers: json["fibers"],
        rating: json["rating"] == null ? 0.0 : json["rating"]?.toDouble(),
        country: json["country"],
        ratings: json["ratings"] ?? 0,
        calories: json["calories"],
        headline: json["headline"],
        keywords: List<String>.from(json["keywords"].map((x) => x)),
        products: List<String>.from(json["products"].map((x) => x)),
        proteins: json["proteins"],
        favorites: json["favorites"],
        difficulty: json["difficulty"],
        description: json["description"],
        highlighted: json["highlighted"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        incompatibilities: json["incompatibilities"] ?? "",
        deliverableIngredients:
            List<String>.from(json["deliverable_ingredients"].map((x) => x)),
        undeliverableIngredients:
            List<dynamic>.from(json["undeliverable_ingredients"].map((x) => x)),
      );
}
