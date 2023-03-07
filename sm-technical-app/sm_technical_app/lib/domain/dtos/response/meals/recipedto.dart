// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'imagesdto.dart';
import 'ingredientdto.dart';

class RecipeDTO {
  final String? uri;
  final String? label;
  final String? image;
  final ImagesDTO? images;
  final String? source;
  final String? url;
  final String? shareAs;
  final double? yield;
  final List<String>? dietLabels;
  final List<String>? healthLabels;
  final List<String>? cautions;
  final List<String>? ingredientLines;
  final List<IngredientDTO>? ingredients;
  RecipeDTO({
    this.uri,
    this.label,
    this.image,
    this.images,
    this.source,
    this.url,
    this.shareAs,
    this.yield,
    this.dietLabels,
    this.healthLabels,
    this.cautions,
    this.ingredientLines,
    this.ingredients,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uri': uri,
      'label': label,
      'image': image,
      'images': images?.toMap(),
      'source': source,
      'url': url,
      'shareAs': shareAs,
      'yield': yield,
      'dietLabels': dietLabels,
      'healthLabels': healthLabels,
      'cautions': cautions,
      'ingredientLines': ingredientLines,
      'ingredients': ingredients?.map((x) => x.toMap()).toList(),
    };
  }

  factory RecipeDTO.fromMap(Map<String, dynamic> map) {
    return RecipeDTO(
      uri: map['uri'] != null ? map['uri'] as String : null,
      label: map['label'] != null ? map['label'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      images: map['images'] != null
          ? ImagesDTO.fromMap(map['images'] as Map<String, dynamic>)
          : null,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipeDTO.fromJson(String source) =>
      RecipeDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
