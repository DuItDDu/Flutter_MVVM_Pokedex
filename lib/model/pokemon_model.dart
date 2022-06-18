import 'package:flutter_mvvm_pokedex/model/pokemon_stat_model.dart';

class PokemonModel {
  int id;
  String name;
  List<String> types;
  int weight;
  int height;
  List<PokemonStatModel> stats;

  PokemonModel(this.id, this.name, this.types, this.weight, this.height, this.stats);
}