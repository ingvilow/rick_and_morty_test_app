import 'package:json_annotation/json_annotation.dart';
part 'Info.g.dart';

@JsonSerializable()
class Info {
  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  final int? count;
  final int? pages;
  final String? next;
  final dynamic prev;

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}