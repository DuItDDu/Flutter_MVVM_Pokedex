import 'package:flutter_mvvm_pokedex/data/source/remote/rest_client.dart';
import 'package:flutter_mvvm_pokedex/model/pokemon_list_model.dart';
import '../../model/pokemon_model.dart';
import '../mapper/pokemon_list_mapper.dart';
import '../mapper/pokemon_mapper.dart';

class PokemonRepository {
  final RestClient _client;
  final PokemonListMapper _pokemonListMapper;
  final PokemonMapper _pokemonMapper;

  PokemonRepository(this._client, this._pokemonListMapper, this._pokemonMapper);

  Future<List<PokemonListModel>> getPokemonList(int limit, int offset) async {
    return _client.getPokemonList(limit, offset)
      .then((value) => _pokemonListMapper.map(value));
  }

  Future<PokemonModel> getPokemon(String name) async {
    return _client.getPokemon(name)
        .then((value) => _pokemonMapper.map(value));
  }
}