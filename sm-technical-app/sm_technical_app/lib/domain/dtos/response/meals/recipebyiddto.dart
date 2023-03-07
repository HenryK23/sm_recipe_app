// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'ingredientdto.dart';

class RecipeByIdDTO {
  final String? uri;
  final String? label;
  final String? image;
  final String? source;
  final String? url;
  final String? shareAs;
  final double? yield;
  final List<String>? dietLabels;
  final List<String>? healthLabels;
  final List<String>? cautions;
  final List<String>? ingredientLines;
  final List<IngredientDTO>? ingredients;
  final double? calories;
  final double? totalWeight;
  final double? totalTime;
  final List<String>? cuisineType;
  final List<String>? mealType;
  final List<String>? dishType;
  final List<String>? instructions;
  RecipeByIdDTO({
    required this.uri,
    required this.label,
    required this.image,
    required this.source,
    required this.url,
    required this.shareAs,
    required this.yield,
    required this.dietLabels,
    required this.healthLabels,
    required this.cautions,
    required this.ingredientLines,
    required this.ingredients,
    required this.calories,
    required this.totalWeight,
    required this.totalTime,
    required this.cuisineType,
    required this.mealType,
    required this.dishType,
    required this.instructions,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uri': uri,
      'label': label,
      'image': image,
      'source': source,
      'url': url,
      'shareAs': shareAs,
      'yield': yield,
      'dietLabels': dietLabels,
      'healthLabels': healthLabels,
      'cautions': cautions,
      'ingredientLines': ingredientLines,
      'ingredients': ingredients?.map((x) => x.toMap()).toList(),
      'calories': calories,
      'totalWeight': totalWeight,
      'totalTime': totalTime,
      'cuisineType': cuisineType,
      'mealType': mealType,
      'dishType': dishType,
      'instructions': instructions,
    };
  }

  factory RecipeByIdDTO.fromMap(Map<String, dynamic> map) {
    return RecipeByIdDTO(
      uri: map['uri'] != null ? map['uri'] as String : null,
      label: map['label'] != null ? map['label'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      source: map['source'] != null ? map['source'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      shareAs: map['shareAs'] != null ? map['shareAs'] as String : null,
      yield: map['yield'] != null ? map['yield'] as double : null,
      dietLabels: map['dietLabels'] != null
          ? List<String>.from((map['dietLabels']))
          : null,
      healthLabels: map['healthLabels'] != null
          ? List<String>.from((map['healthLabels']))
          : null,
      cautions:
          map['cautions'] != null ? List<String>.from((map['cautions'])) : null,
      ingredientLines: map['ingredientLines'] != null
          ? List<String>.from((map['ingredientLines']))
          : null,
      ingredients: map['ingredients'] != null
          ? List<IngredientDTO>.from(
              (map['ingredients'] as List<dynamic>).map<IngredientDTO?>(
                (x) => IngredientDTO.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      calories: map['calories'] != null ? map['calories'] as double : null,
      totalWeight:
          map['totalWeight'] != null ? map['totalWeight'] as double : null,
      totalTime: map['totalTime'] != null ? map['totalTime'] as double : null,
      cuisineType: map['cuisineType'] != null
          ? List<String>.from((map['cuisineType']))
          : null,
      mealType:
          map['mealType'] != null ? List<String>.from((map['mealType'])) : null,
      dishType:
          map['dishType'] != null ? List<String>.from((map['dishType'])) : null,
      instructions: map['instructions'] != null
          ? List<String>.from((map['instructions']))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipeByIdDTO.fromJson(String source) =>
      RecipeByIdDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
