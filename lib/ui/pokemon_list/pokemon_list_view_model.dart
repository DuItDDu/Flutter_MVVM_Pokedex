import 'package:flutter_mvvm_pokedex/data/repository/pokemon_repository.dart';
import 'package:stacked/stacked.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../model/pokemon_list_model.dart';

class PokemonListViewModel extends BaseViewModel {
  static const POKEMON_LIST_LIMIT = 20;

  final PokemonRepository _pokemonRepository;
  final PagingController<int, PokemonListModel> pagingController = PagingController(firstPageKey: 0);

  PokemonListViewModel(this._pokemonRepository) {
    pagingController.addPageRequestListener((pageKey) {
      loadPokemonList(POKEMON_LIST_LIMIT, pageKey);
    });
  }

  void loadPokemonList(int limit, int offset) async {
    _pokemonRepository.getPokemonList(limit, offset)
        .then((value) => _loadPokemonList(offset, value));
  }

  void _loadPokemonList(
      int offset,
      List<PokemonListModel> pokemonList
  ) {
    if (pokemonList.length < POKEMON_LIST_LIMIT) {
      pagingController.appendLastPage(pokemonList);
    } else {
      pagingController.appendPage(pokemonList, offset + pokemonList.length);
    }
    notifyListeners();
  }
}