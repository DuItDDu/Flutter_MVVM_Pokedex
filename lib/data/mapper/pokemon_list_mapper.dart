import 'package:flutter_mvvm_pokedex/data/source/remote/response/pokemon_list_response.dart';
import '../../model/pokemon_list_model.dart';

class PokemonListMapper {
  PokemonListModel map(PokemonListResponse data) {
    return PokemonListModel();
  }
}