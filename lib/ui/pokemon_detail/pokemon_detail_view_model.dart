
import 'package:flutter_mvvm_pokedex/data/repository/pokemon_repository.dart';
import 'package:flutter_mvvm_pokedex/ui/pokemon_detail/pokemon_detail_arguments.dart';
import 'package:stacked/stacked.dart';

import '../../model/pokemon_model.dart';

class PokemonDetailViewModel extends BaseViewModel {
  final PokemonDetailArguments? args;
  final PokemonRepository _pokemonRepository;

  PokemonModel? _pokemon;
  PokemonModel? get pokemon => _pokemon;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isError = false;
  bool get isError => _isError;

  PokemonDetailViewModel(this.args, this._pokemonRepository) {
    _loadPokemonDetail(args);
  }

  void _loadPokemonDetail(PokemonDetailArguments? args) {
    final pokemonName = args?.name;
    if (pokemonName != null) {
      _loadPokemonDetailWithName(pokemonName);
    } else {
      _isError = true;
      notifyListeners();
    }
  }

  void _loadPokemonDetailWithName(String pokemonName) async {
    _isLoading = true;
    notifyListeners();

    _pokemon = await _pokemonRepository.getPokemon(pokemonName);
    _isLoading = false;
    notifyListeners();
  }
}