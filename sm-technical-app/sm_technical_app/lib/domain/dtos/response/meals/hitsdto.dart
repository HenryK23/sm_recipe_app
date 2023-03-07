// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:sm_technical_app/domain/dtos/response/meals/recipedto.dart';

class HitsDTO {
  final RecipeDTO recipe;
  HitsDTO({
    required this.recipe,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'recipe': recipe.toMap(),
    };
  }

  factory HitsDTO.fromMap(Map<String, dynamic> map) {
    return HitsDTO(
      recipe: RecipeDTO.fromMap(map['recipe'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory HitsDTO.fromJson(String source) =>
      HitsDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
