import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ImageDTO {
  String url;
  int width;
  int height;
  ImageDTO({
    required this.url,
    required this.width,
    required this.height,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'width': width,
      'height': height,
    };
  }

  factory ImageDTO.fromMap(Map<String, dynamic> map) {
    return ImageDTO(
      url: map['url'] as String,
      width: map['width'] as int,
      height: map['height'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageDTO.fromJson(String source) =>
      ImageDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
