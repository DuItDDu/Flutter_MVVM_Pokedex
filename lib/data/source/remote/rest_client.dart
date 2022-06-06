import 'package:flutter_mvvm_pokedex/data/source/remote/response/pokemon_list_response.dart';
import 'package:flutter_mvvm_pokedex/data/source/remote/response/pokemon_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: "")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("pokemon")
  Future<PokemonListResponse> getPokemonList(
      @Query("limit") int limit,
      @Query("offset") int offset
  );

  @GET("pokemon/{name}")
  Future<PokemonResponse> getPokemon(
      @Path("name") String name
  );
}