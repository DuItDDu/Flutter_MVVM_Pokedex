import 'package:flutter/material.dart';
import 'package:flutter_mvvm_pokedex/utils/pokemon_colors.dart';

class PokemonUtil {

  static String convertIdToNumber(int id) {
    return id.toString().padLeft(3, "0");
  }

  static String getImageUrlByNumber(String number) {
    return "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/$number.png";
  }

  static String getImageUrlById(int id) {
    final number = convertIdToNumber(id);
    return getImageUrlByNumber(number);
  }

  static Color getPokemonTypeColor(String type) {
    switch (type) {
      case "normal":
        return PokemonColors.gray500;
      case "fire":
        return PokemonColors.red500;
      case "water":
        return PokemonColors.blue500;
      case "electric":
        return PokemonColors.yellow500;
      case "grass":
        return PokemonColors.green500;
      case "ice":
        return PokemonColors.blue300;
      case "fighting":
        return PokemonColors.red400;
      case "poison":
        return PokemonColors.purple400;
      case "ground":
        return PokemonColors.amber700;
      case "flying":
        return PokemonColors.gray600;
      case "psychic":
        return PokemonColors.purple500;
      case "bug":
        return PokemonColors.teal;
      case "rock":
        return PokemonColors.brown500;
      case "ghost":
        return PokemonColors.purple600;
      case "dragon":
        return PokemonColors.orange500;
      case "dark":
        return PokemonColors.gray600;
      case "steel":
        return PokemonColors.blueGray400;
      case "fairy":
        return PokemonColors.pink400;
      default:
        return PokemonColors.gray500;
    }
  }

  static String convertShortStatName(String stat) {
    switch (stat) {
      case "hp":
        return "HP";
      case "attack":
        return "ATK";
      case "defense":
        return "DEF";
      case "special-attack":
        return "SP ATK";
      case "special-defense":
        return "SP DEF";
      case "speed":
        return "SPD";
      default:
        return "";
    }
  }
}