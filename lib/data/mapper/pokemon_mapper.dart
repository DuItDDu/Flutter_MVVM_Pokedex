import 'package:flutter_mvvm_pokedex/data/source/remote/response/pokemon_response.dart';
import '../../model/pokemon_model.dart';

class PokemonMapper {
  PokemonModel map(PokemonResponse data) {
    return PokemonModel();
  }
}