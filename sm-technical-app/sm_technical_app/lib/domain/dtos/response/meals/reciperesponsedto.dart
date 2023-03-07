// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:sm_technical_app/domain/dtos/response/meals/hitsdto.dart';

class RecipeResponseDTO {
  final int from;
  final int to;
  final int count;
  final List<HitsDTO> hits;
  RecipeResponseDTO({
    required this.from,
    required this.to,
    required this.count,
    required this.hits,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'from': from,
      'to': to,
      'count': count,
      'hits': hits.map((x) => x.toMap()).toList(),
    };
  }

  factory RecipeResponseDTO.fromMap(Map<String, dynamic> map) {
    return RecipeResponseDTO(
      from: map['from'] as int,
      to: map['to'] as int,
      count: map['count'] as int,
      hits: List<HitsDTO>.from(
        (map['hits'] as List<dynamic>).map<HitsDTO>(
          (x) => HitsDTO.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipeResponseDTO.fromJson(String source) =>
      RecipeResponseDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
