import 'package:json_annotation/json_annotation.dart';

part 'Location.g.dart';

@JsonSerializable()
class Location {
  Location({
    required this.name,
    required this.url,
  });

  final String? name;
  final String? url;

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
