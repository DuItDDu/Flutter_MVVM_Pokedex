// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonListResponse _$PokemonListResponseFromJson(Map<String, dynamic> json) =>
    PokemonListResponse(
      (json['results'] as List<dynamic>)
          .map((e) =>
              PokemonListItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonListResponseToJson(
        PokemonListResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

PokemonListItemResponse _$PokemonListItemResponseFromJson(
        Map<String, dynamic> json) =>
    PokemonListItemResponse(
      json['name'] as String,
      json['url'] as String,
    );

Map<String, dynamic> _$PokemonListItemResponseToJson(
        PokemonListItemResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
