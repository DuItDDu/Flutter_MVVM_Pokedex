import 'package:flutter_mvvm_pokedex/data/source/remote/response/pokemon_response.dart';
import 'package:flutter_mvvm_pokedex/model/pokemon_stat_model.dart';
import '../../model/pokemon_model.dart';

class PokemonMapper {
  PokemonModel map(PokemonResponse data) {
    return PokemonModel(
      data.id,
      data.name,
      data.types.map((e) => e.type.name).toList(),
      data.weight,
      data.height,
      data.stats.map((e) => PokemonStatModel(e.stat.name, e.baseStat)).toList()
    );
  }
}