import 'package:equatable/equatable.dart';

class Recipe extends Equatable {
  final String id;
  final String fats;
  final String name;
  final String time;
  final String image;
  final List<String> weeks;
  final String carbos;
  final String fibers;
  final double? rating;
  final String country;
  final int? ratings;
  final String calories;
  final String headline;
  final List<String> keywords;
  final List<String> products;
  final String proteins;
  final int favorites;
  final int difficulty;
  final String description;
  final bool highlighted;
  final List<String> ingredients;
  final String? incompatibilities;
  final List<String> deliverableIngredients;
  final List<dynamic> undeliverableIngredients;

  const Recipe({
    required this.id,
    required this.fats,
    required this.name,
    required this.time,
    required this.image,
    required this.weeks,
    required this.carbos,
    required this.fibers,
    this.rating,
    required this.country,
    this.ratings,
    required this.calories,
    required this.headline,
    required this.keywords,
    required this.products,
    required this.proteins,
    required this.favorites,
    required this.difficulty,
    required this.description,
    required this.highlighted,
    required this.ingredients,
    this.incompatibilities,
    required this.deliverableIngredients,
    required this.undeliverableIngredients,
  });

  @override
  List<Object?> get props => [
        id,
        fats,
        name,
        time,
        image,
        weeks,
        carbos,
        fibers,
        rating,
        country,
        ratings,
        calories,
        headline,
        keywords,
        products,
        proteins,
        favorites,
        difficulty,
        description,
        highlighted,
        ingredients,
        incompatibilities,
        deliverableIngredients,
        undeliverableIngredients,
      ];
}
