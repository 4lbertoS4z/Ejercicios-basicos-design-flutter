import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'ListPokemon.dart';

class PokemonDetailPage extends StatefulWidget {
  final int initialPage;
  final List<Pokemon> pokemonList;

  PokemonDetailPage({
    Key? key,
    required this.initialPage,
    required this.pokemonList,
  }) : super(key: key);

  @override
  _PokemonDetailPageState createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Pagina detalle',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.green],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.pokemonList.length,
                itemBuilder: (context, index) {
                  Pokemon pokemon = widget.pokemonList[index];
                  return SingleChildScrollView(
                    padding: EdgeInsets.all(80.0),
                    child: Column(
                      children: [
                        Image.network(
                          pokemon.urlImage,
                          width: MediaQuery.of(context).size.width,
                          height: 300,
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Nombre: ${pokemon.name}',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Descripción: ${pokemon.description}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Tipo: ${pokemon.type}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Peso: ${pokemon.weight}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Altura: ${pokemon.height}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Text(
                          'Galería de Pokémon',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: widget.pokemonList.map((pokemon) {
                            return Image.network(
                              pokemon.urlImage,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: widget.pokemonList.length,
              effect: SwapEffect(),
            ),
          ],
        ),
      ),
    );
  }
}
