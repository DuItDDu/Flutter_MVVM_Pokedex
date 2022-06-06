import 'package:json_annotation/json_annotation.dart';
part 'pokemon_list_response.g.dart';

@JsonSerializable()
class PokemonListResponse {
  List<PokemonListItemResponse> results;

  PokemonListResponse(this.results);

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) => _$PokemonListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonListResponseToJson(this);
}

@JsonSerializable()
class PokemonListItemResponse {
  String name;
  String url;

  PokemonListItemResponse(this.name, this.url);

  factory PokemonListItemResponse.fromJson(Map<String, dynamic> json) => _$PokemonListItemResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonListItemResponseToJson(this);
}