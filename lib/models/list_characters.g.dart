// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_characters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersList _$CharactersListFromJson(Map<String, dynamic> json) =>
    CharactersList(
      info: Info.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharactersListToJson(CharactersList instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.results,
    };
