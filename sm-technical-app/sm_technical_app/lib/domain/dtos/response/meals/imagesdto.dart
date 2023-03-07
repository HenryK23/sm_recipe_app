// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:sm_technical_app/domain/dtos/response/meals/imagedto.dart';

class ImagesDTO {
  final ImageDTO? thumbnail;
  final ImageDTO? small;
  final ImageDTO? regular;
  final ImageDTO? large;
  ImagesDTO({
    this.thumbnail,
    this.small,
    this.regular,
    this.large,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'thumbnail': thumbnail?.toMap(),
      'small': small?.toMap(),
      'regular': regular?.toMap(),
      'large': large?.toMap(),
    };
  }

  factory ImagesDTO.fromMap(Map<String, dynamic> map) {
    return ImagesDTO(
      thumbnail: map['thumbnail'] != null
          ? ImageDTO.fromMap(map['thumbnail'] as Map<String, dynamic>)
          : null,
      small: map['small'] != null
          ? ImageDTO.fromMap(map['small'] as Map<String, dynamic>)
          : null,
      regular: map['regular'] != null
          ? ImageDTO.fromMap(map['regular'] as Map<String, dynamic>)
          : null,
      large: map['large'] != null
          ? ImageDTO.fromMap(map['large'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImagesDTO.fromJson(String source) =>
      ImagesDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
