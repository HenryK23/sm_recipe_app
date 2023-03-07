import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DigestDTO {
  final String label;
  final String tag;
  final String schemaOrgTag;
  final double total;
  final bool hasRDI;
  final double daily;
  final String unit;
  DigestDTO({
    required this.label,
    required this.tag,
    required this.schemaOrgTag,
    required this.total,
    required this.hasRDI,
    required this.daily,
    required this.unit,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'label': label,
      'tag': tag,
      'schemaOrgTag': schemaOrgTag,
      'total': total,
      'hasRDI': hasRDI,
      'daily': daily,
      'unit': unit,
    };
  }

  factory DigestDTO.fromMap(Map<String, dynamic> map) {
    return DigestDTO(
      label: map['label'] as String,
      tag: map['tag'] as String,
      schemaOrgTag: map['schemaOrgTag'] as String,
      total: map['total'] as double,
      hasRDI: map['hasRDI'] as bool,
      daily: map['daily'] as double,
      unit: map['unit'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DigestDTO.fromJson(String source) =>
      DigestDTO.fromMap(json.decode(source) as Map<String, dynamic>);
}
