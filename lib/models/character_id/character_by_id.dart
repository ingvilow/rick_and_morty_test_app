import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'package:rick_and_morty_test_app/models/character_id/single_character_location.dart';
part 'character_by_id.g.dart';

CharactersById charactersByIdFromJson(String str) => CharactersById.fromJson(json.decode(str));
String charactersByIdToJson(CharactersById data) => json.encode(data.toJson());



@JsonSerializable()
class CharactersById {
  CharactersById({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Location origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  factory CharactersById.fromJson(Map<String, dynamic> json) => _$CharactersByIdFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersByIdToJson(this);
}

