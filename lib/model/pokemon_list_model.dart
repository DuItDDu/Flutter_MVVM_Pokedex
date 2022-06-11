class PokemonListModel {
  final String name;
  final int id;

  String get number => id.toString().padLeft(3, "0");
  String get imageUrl => "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/$number.png";

  PokemonListModel(this.name, this.id);
}