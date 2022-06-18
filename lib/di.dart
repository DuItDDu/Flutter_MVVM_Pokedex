import 'package:flutter_mvvm_pokedex/data/mapper/pokemon_mapper.dart';
import 'package:flutter_mvvm_pokedex/data/repository/pokemon_repository.dart';
import 'package:flutter_mvvm_pokedex/data/source/remote/rest_client.dart';
import 'package:flutter_mvvm_pokedex/ui/pokemon_list/pokemon_list_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'data/mapper/pokemon_list_mapper.dart';

final GetIt getIt = GetIt.instance;

Future<void> inject() async {
  /** Mapper */
  getIt.registerLazySingleton(() => PokemonListMapper());
  getIt.registerLazySingleton(() => PokemonMapper());
  
  /** API */
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => RestClient(getIt()));

  /** Repository */
  getIt.registerLazySingleton(() => PokemonRepository(getIt(), getIt(), getIt()));
}