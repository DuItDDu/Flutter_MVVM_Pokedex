import 'package:flutter/material.dart';
import 'package:flutter_mvvm_pokedex/ui/pokemon_detail/pokemon_detail_view.dart';
import 'package:flutter_mvvm_pokedex/ui/pokemon_list/pokemon_list_view.dart';
import 'di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.inject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "pokemon_list",
      routes: {
        "pokemon_list" : (context) => const PokemonListView(),
        "pokemon_detail" : (context) => const PokemonDetailView()
      },
    );
  }
}