import 'package:flutter/material.dart';
import 'package:flutter_mvvm_pokedex/ui/pokemon_list/pokemon_list_view_model.dart';
import 'package:flutter_mvvm_pokedex/utils/pokemon_util.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_mvvm_pokedex/di.dart';
import '../../model/pokemon_list_model.dart';
import '../pokemon_detail/pokemon_detail_arguments.dart';

class PokemonListView extends StatelessWidget {
  const PokemonListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PokemonListViewModel>.reactive(
        viewModelBuilder: () => PokemonListViewModel(getIt()),
        builder: (context, viewModel, child) =>
            _build(context, viewModel, child)
    );
  }

  Widget _build(
      BuildContext context,
      PokemonListViewModel viewModel,
      Widget? child
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: _pokemonGridView(viewModel.pagingController),
        ),
      ),
    );
  }

  Widget _pokemonGridView(PagingController<int, PokemonListModel> controller) {
    return PagedGridView(
      pagingController: controller,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16
      ),
      builderDelegate: PagedChildBuilderDelegate<PokemonListModel>(
          itemBuilder: (context, item, index) =>
              _pokemonGridViewItem(context, item)
      ),
    );
  }

  Widget _pokemonGridViewItem(BuildContext context, PokemonListModel item) {
    return GestureDetector(
      child: _pokemonGridItemCard(item),
      onTap: () { _onPokemonItemTapped(context, item); }
    );
  }

  Widget _pokemonGridItemCard(PokemonListModel item) {
    return Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0)
        ),
        elevation: 4.0,
        child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0, bottom: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "#${PokemonUtil.convertIdToNumber(item.id)}",
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black38
                  ),
                ),
                Text(
                  item.name,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black87
                  ),
                ),
                Expanded(
                    child: Center(
                        child: Image.network(PokemonUtil.getImageUrlById(item.id))
                    )
                )
              ],
            )
        )
    );
  }

  void _onPokemonItemTapped(
      BuildContext context,
      PokemonListModel item
  ) {
    Navigator.pushNamed(
      context,
      "pokemon_detail",
      arguments: PokemonDetailArguments(item.name)
    );
  }
}