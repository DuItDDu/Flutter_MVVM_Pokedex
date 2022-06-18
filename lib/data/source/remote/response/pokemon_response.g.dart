// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonResponse _$PokemonResponseFromJson(Map<String, dynamic> json) =>
    PokemonResponse(
      json['id'] as int,
      json['name'] as String,
      json['height'] as int,
      json['weight'] as int,
      (json['stats'] as List<dynamic>)
          .map((e) => PokemonStatResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['types'] as List<dynamic>)
          .map((e) => PokemonTypeResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonResponseToJson(PokemonResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'height': instance.height,
      'weight': instance.weight,
      'stats': instance.stats,
      'types': instance.types,
    };

PokemonStatResponse _$PokemonStatResponseFromJson(Map<String, dynamic> json) =>
    PokemonStatResponse(
      json['base_stat'] as int,
      PokemonStatNameResponse.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonStatResponseToJson(
        PokemonStatResponse instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'stat': instance.stat,
    };

PokemonStatNameResponse _$PokemonStatNameResponseFromJson(
        Map<String, dynamic> json) =>
    PokemonStatNameResponse(
      json['name'] as String,
    );

Map<String, dynamic> _$PokemonStatNameResponseToJson(
        PokemonStatNameResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

PokemonTypeResponse _$PokemonTypeResponseFromJson(Map<String, dynamic> json) =>
    PokemonTypeResponse(
      PokemonTypeNameResponse.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonTypeResponseToJson(
        PokemonTypeResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

PokemonTypeNameResponse _$PokemonTypeNameResponseFromJson(
        Map<String, dynamic> json) =>
    PokemonTypeNameResponse(
      json['name'] as String,
    );

Map<String, dynamic> _$PokemonTypeNameResponseToJson(
        PokemonTypeNameResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
