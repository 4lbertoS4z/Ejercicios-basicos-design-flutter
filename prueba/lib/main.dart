import 'package:flutter/material.dart';
import 'package:prueba/ListPokemon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Pokémons',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ListPokemon(),
    );
  }
}

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('Lista de Pokémons'),
        backgroundColor: const Color.fromARGB(255, 255, 64, 64),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            color: Color.fromARGB(255, 235, 153, 148),
            child: ListTile(
              leading: Image.asset('assets/images/charmander.png'),
              title: const Text(
                'Charmander',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Color.fromARGB(255, 139, 135, 15)),
              ),
              subtitle: const Text('Descripción de Charmander\nfire'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Selección de Pokémon'),
                      content: Text(
                          'Has pulsado el Charmander de la posición ${index + 1}'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
