import 'package:flutter/material.dart';
import 'package:flutter_mvvm_pokedex/model/pokemon_model.dart';
import 'package:flutter_mvvm_pokedex/ui/pokemon_detail/pokemon_detail_arguments.dart';
import 'package:flutter_mvvm_pokedex/ui/pokemon_detail/pokemon_detail_view_model.dart';
import 'package:flutter_mvvm_pokedex/utils/pokemon_colors.dart';
import 'package:flutter_mvvm_pokedex/utils/pokemon_util.dart';
import 'package:stacked/stacked.dart';

import '../../di.dart';
import '../../model/pokemon_stat_model.dart';

class PokemonDetailView extends StatelessWidget {
  const PokemonDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as PokemonDetailArguments?;
    return ViewModelBuilder<PokemonDetailViewModel>.reactive(
        viewModelBuilder: () => PokemonDetailViewModel(args, getIt()),
        builder: (context, viewModel, child) =>
            _build(context, viewModel, child));
  }

  Widget _build(
      BuildContext context, PokemonDetailViewModel viewModel, Widget? child) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: _buildBody(context, viewModel, child),
          ),
        ));
  }

  Widget _buildBody(
      BuildContext context, PokemonDetailViewModel viewModel, Widget? child) {
    if (viewModel.isLoading) {
      return _buildLoadingView();
    } else if (viewModel.isError) {
      return _buildErrorView("Invalid arguments");
    } else {
      return _buildPokemonDetailView(viewModel.pokemon);
    }
  }

  Widget _buildLoadingView() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorView(String msg) {
    return Center(
      child: Text(msg),
    );
  }

  Widget _buildPokemonDetailView(PokemonModel? pokemon) {
    if (pokemon != null) {
      return _buildPokemonDetailViews(pokemon);
    } else {
      return _buildErrorView("Pokemon not found.");
    }
  }

  Widget _buildPokemonDetailViews(PokemonModel pokemon) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildPokemonImage(PokemonUtil.getImageUrlById(pokemon.id)),
          _buildPokemonInfo(pokemon.id, pokemon.name),
          const SizedBox(height: 16),
          _buildPokemonTypeRow(pokemon.types),
          const SizedBox(height: 16),
          _buildPokemonPhysicalInfoView(pokemon.weight, pokemon.height),
          const SizedBox(height: 24),
          _buildPokemonStatTable(pokemon.stats)
        ],
      ),
    );
  }

  Widget _buildPokemonImage(String imageUrl) {
    return Image.network(imageUrl);
  }

  Widget _buildPokemonInfo(int id, String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "#${PokemonUtil.convertIdToNumber(id)}",
          style: const TextStyle(
              color: Colors.black87,
              fontSize: 20.0,
              fontWeight: FontWeight.w400),
        ),
        Text(
          name,
          style: const TextStyle(
              color: Colors.black87,
              fontSize: 24.0,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildPokemonTypeRow(List<String> types) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: types.map((e) => _buildPokemonTypeRowItem(e)).toList(),
      ),
    );
  }

  Widget _buildPokemonTypeRowItem(String type) {
    return Container(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        shape: const StadiumBorder(),
        color: PokemonUtil.getPokemonTypeColor(type),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 8.0, right: 8.0, top: 4.0, bottom: 4.0),
          child: Text(
            type,
            style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildPokemonPhysicalInfoView(int weight, int height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildPokemonPhysicalInfoText("Height", height / 10.0, "m"),
        const SizedBox(width: 48),
        _buildPokemonPhysicalInfoText("Weight", weight / 10.0, "kg")
      ],
    );
  }

  Widget _buildPokemonPhysicalInfoText(
      String label, double value, String unit) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$value$unit",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Colors.black87,
              fontSize: 16.0,
              fontWeight: FontWeight.w400),
        )
      ],
    );
  }

  Widget _buildPokemonStatTable(List<PokemonStatModel> stats) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: stats.map((e) => _buildPokemonStatRow(e)).toList(),
    );
  }

  Widget _buildPokemonStatRow(PokemonStatModel stat) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            PokemonUtil.convertShortStatName(stat.name),
            style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                fontSize: 16.0
            ),
          )
        ),
        Expanded(
            flex: 1,
            child: Text(
              stat.value.toString(),
              style: const TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0
              ),
            )
        ),
        Expanded(
            flex: 5,
            child: LinearProgressIndicator(
              value: stat.value / 300.0,
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              backgroundColor: Colors.blueGrey
            )
        ),
        const SizedBox(height: 8)
      ],
    );
  }
}
