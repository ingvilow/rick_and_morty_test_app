import 'dart:convert';
import 'package:rick_and_morty_test_app/models/Info.dart';
import 'package:rick_and_morty_test_app/models/Result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_characters.g.dart';


CharactersList charactersListFromJson(String str) => CharactersList.fromJson(json.decode(str));

String charactersListToJson(CharactersList data) => json.encode(data.toJson());

@JsonSerializable()
class CharactersList {
  CharactersList({
    required this.info,
    required this.results,
  });

  final Info info;
  final List<Result> results;

  factory CharactersList.fromJson(Map<String, dynamic> json) => _$CharactersListFromJson(json);

  Map<String, dynamic> toJson() => _$CharactersListToJson(this);
}

