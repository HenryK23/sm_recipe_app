// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class IngredientDTO {
  final String? text;
  final double? quantity;
  final String? measure;
  final String? food;
  final double? weight;
  final String? foodId;

  IngredientDTO(
    this.text,
    this.quantity,
    this.measure,
    this.food,
    this.weight,
    this.foodId,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'quantity': quantity,
      'measure': measure,
      'food': food,
      'weight': weight,
      'foodId': foodId,
    };
  }

  factory IngredientDTO.fromMap(Map<String, dynamic> map) {
    return IngredientDTO(
      map['text'] != null ? map['text'] as String : null,
      map['quantity'] != null ? map['quantity'] as double : null,
      map['measure'] != null ? map['measure'] as String : null,
      map['food'] != null ? map['food'] as String : null,
      map['weight'] != null ? map['weight'] as double : null,
      map['foodId'] != null ? map['foodId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory IngredientDTO.fromJson(String source) =>
      IngredientDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
