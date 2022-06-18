import 'package:json_annotation/json_annotation.dart';
part 'pokemon_response.g.dart';

@JsonSerializable()
class PokemonResponse {
  int id;
  String name;
  int height;
  int weight;
  List<PokemonStatResponse> stats;
  List<PokemonTypeResponse> types;

  PokemonResponse(this.id, this.name, this.height, this.weight, this.stats, this.types);

  factory PokemonResponse.fromJson(Map<String, dynamic> json) => _$PokemonResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonResponseToJson(this);
}

@JsonSerializable()
class PokemonStatResponse {
  @JsonKey(name: "base_stat")
  int baseStat;

  PokemonStatNameResponse stat;

  PokemonStatResponse(this.baseStat, this.stat);

  factory PokemonStatResponse.fromJson(Map<String, dynamic> json) => _$PokemonStatResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonStatResponseToJson(this);
}

@JsonSerializable()
class PokemonStatNameResponse {
  String name;

  PokemonStatNameResponse(this.name);

  factory PokemonStatNameResponse.fromJson(Map<String, dynamic> json) => _$PokemonStatNameResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonStatNameResponseToJson(this);
}

@JsonSerializable()
class PokemonTypeResponse {
  PokemonTypeNameResponse type;

  PokemonTypeResponse(this.type);

  factory PokemonTypeResponse.fromJson(Map<String, dynamic> json) => _$PokemonTypeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonTypeResponseToJson(this);
}

@JsonSerializable()
class PokemonTypeNameResponse {
  String name;
  PokemonTypeNameResponse(this.name);

  factory PokemonTypeNameResponse.fromJson(Map<String, dynamic> json) => _$PokemonTypeNameResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonTypeNameResponseToJson(this);
}