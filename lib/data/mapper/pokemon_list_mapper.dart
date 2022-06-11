import 'package:flutter_mvvm_pokedex/data/source/remote/response/pokemon_list_response.dart';
import '../../model/pokemon_list_model.dart';

class PokemonListMapper {
  List<PokemonListModel> map(PokemonListResponse data) {
    return data.results.map((e) => PokemonListModel(e.name, _getId(e.url))).toList();
  }

  int _getId(String url) {
    final components = url.split("/");
    components.removeLast();
    return int.parse(components.last);
  }
}