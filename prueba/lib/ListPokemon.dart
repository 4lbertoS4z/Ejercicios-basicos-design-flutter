import 'package:flutter/material.dart';

import 'PokemonDetailPage.dart';
import 'PokemonFormScreen.dart';

class ListPokemon extends StatefulWidget {
  const ListPokemon({super.key});

  @override
  State<ListPokemon> createState() => _ListPokemonState();
}

class _ListPokemonState extends State<ListPokemon> {
  //Lista de pokemons que vamos a representar
  List<Pokemon> pokemonList = [
    Pokemon(
        name: 'Pikachu',
        description:
            'Cuando se enfada, este Pokémon descarga la energía que almacena en el interior de las bolsas de las mejillas.',
        urlImage:
            'https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png',
        type: "Electric",
        weight: "5Kg"),
    Pokemon(
        name: 'Charmander',
        description:
            'Prefiere las cosas calientes. Dicen que cuando llueve le sale vapor de la punta de la cola.',
        urlImage:
            'https://assets.pokemon.com/assets/cms2/img/pokedex/full/004.png',
        type: "Fire",
        height: "40cm"),
    Pokemon(
        name: 'Squirtle',
        description:
            'Cuando retrae su largo cuello en el caparazón, dispara agua a una presión increíble.',
        urlImage:
            'https://assets.pokemon.com/assets/cms2/img/pokedex/full/007.png',
        type: "Water",
        weight: "20Kg",
        height: "80cm"),
    Pokemon(
      name: 'Bulbasaur',
      description:
          'Cuando le crece bastante el bulbo del lomo, pierde la capacidad de erguirse sobre las patas traseras.',
      urlImage:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png',
      type: 'Grass/Poison',
    ),
    Pokemon(
      name: 'Jigglypuff',
      description:
          'Cuando le tiemblan sus redondos y adorables ojos, entona una melodía agradable y misteriosa con la que duerme a sus enemigos.',
      urlImage:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/039.png',
      type: 'Normal/Fairy',
    ),
    Pokemon(
      name: 'Meowth',
      description:
          'Durante el día, se dedica a dormir. De noche, vigila su territorio con un brillo en los ojos.',
      urlImage:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/052.png',
      type: 'Normal',
    ),
    Pokemon(
      name: 'Geodude',
      description: 'Rock/Ground-type Pokémon',
      urlImage:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/074.png',
      type: 'Rock/Ground',
    ),
    Pokemon(
      name: 'Psyduck',
      description:
          'Padece continuamente dolores de cabeza. Cuando son muy fuertes, empieza a usar misteriosos poderes.',
      urlImage:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/054.png',
      type: 'Water',
    ),
    Pokemon(
      name: 'Machop',
      description:
          'Es una masa de músculos y, pese a su pequeño tamaño, tiene fuerza de sobra para levantar en brazos a 100 personas.',
      urlImage:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/066.png',
      type: 'Fighting',
    ),
    Pokemon(
      name: 'Abra',
      description:
          'Es capaz de usar sus poderes psíquicos aun estando dormido. Al parecer, el contenido del sueño influye en sus facultades.',
      urlImage:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/063.png',
      type: 'Psychic',
    ),
    Pokemon(
      name: 'Gyarados',
      description: 'Water/Flying-type Pokémon',
      urlImage:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/130.png',
      type: 'Water/Flying',
    ),
    Pokemon(
      name: 'Alakazam',
      description: 'Psychic-type Pokémon',
      urlImage:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/065.png',
      type: 'Psychic',
    ),
    Pokemon(
      name: 'Dragonite',
      description: 'Dragon/Flying-type Pokémon',
      urlImage:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/149.png',
      type: 'Dragon/Flying',
    ),
    Pokemon(
      name: 'Mewtwo',
      description: 'Psychic-type Pokémon',
      urlImage:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/150.png',
      type: 'Psychic',
    ),
    Pokemon(
      name: 'Mew',
      description: 'Psychic-type Pokémon',
      urlImage:
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/151.png',
      type: 'Psychic',
    ),
  ];

  //Boleano que controla nuestro switch
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          "Lista de Pokemons",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PokemonFormScreen(
                    onFormSubmit: (newPokemon) {
                      setState(() {
                        pokemonList.add(newPokemon);
                      });
                      Navigator.pop(context); // Vuelve a la lista
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        //Definimos la imagen de fondo de la app
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://i.pinimg.com/originals/a1/86/a8/a186a8aff83506c70b0b307e3fb062c8.png"),
                fit: BoxFit
                    .cover //Usamos BoxFit cover por que queremos que toda la imagen "cubra" el Container. Dado que el Container
                //no tiene un alto y ancho defino va a cubrir toda la pantalla.
                )),
        child: Padding(
          //Aplicamos un padding de 90 para que el switch y el texto que le acompaña queden por debajo de la appbar.
          //Es posible que esto se puede hacer mejor
          padding: const EdgeInsets.only(top: 90),
          child: Column(
            children: [
              //Definimos el switch y su leyenda
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, //opcional -> Centra Switch y texto que le acompaña
                children: [
                  Switch(
                      value: _switchValue,
                      onChanged: (value) {
                        setState(() {
                          //Usamos setState porque queremos repintar un nuevo estado de la pantalla
                          _switchValue = !_switchValue;
                        });
                      }),
                  const Text(
                    "Mostrar lista de Pokemons",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),

              //Definimos la lista
              _switchValue
                  ? WidgetListaPokemon(pokemonList: pokemonList)
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class WidgetListaPokemon extends StatelessWidget {
  const WidgetListaPokemon({
    super.key,
    required this.pokemonList,
  });

  final List<Pokemon> pokemonList;

  @override
  Widget build(BuildContext context) {
    //La lista la tenemos que incluir dentro de un Expanded para que sepa que ha de ocupar todo el espacio
    //posible de la pantalla. Si no usamos exte expanded la lista cuenta con espacio infinito y peta la app
    return Expanded(
        child: ListView.builder(
            //Dado que las ListView ya vienen con un padding por defecto, ponemos un padding 0 en todos
            //lados para quitar ese padding por defecto. Ese padding por defecto da la sensación de que la lista
            //no esta en su lugar o que no empieza correctamente desde la parte superior de la pantalla
            padding: const EdgeInsets.all(0),
            itemCount: pokemonList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20)),
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Padding(
                      //Pequeño padding para separar los elementos de la lista, sobretodo a en el eje horizontal.
                      //Esto es opcional
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        children: [
                          Image.network(pokemonList[index].urlImage),
                          //Este Sizedbox es para dar un pequeño separado entre la imagen del pokemon y los otros datos
                          const SizedBox(
                            width: 20,
                          ),
                          //Incluimos un Flexible para controlar que el texto de la descripción del pokemon puede desbordar un poco
                          //sin que suponga un overflow y en caso de overflow poder aplicar un correctivo como la elipsis.
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceEvenly, //Espaciamos veerticalmente los textos de nombre de pokemn, descripcion y tipo
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, //Indicamos que los textos de nombre de pokemn, descripcipn y tipo han de empezar por la izquierda
                              children: [
                                Text(
                                  pokemonList[index].name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right:
                                          16.0), //aplicamos un padding solo a la derecha para que el icono de delete no quede tan pegado al borde derecho
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          pokemonList[index].description,
                                          maxLines: 2,
                                          overflow: TextOverflow
                                              .ellipsis, // Asegúrate de que esta línea esté presente
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.ac_unit_sharp),
                                    Text(pokemonList[index].type),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    pokemonList[index].weight == null
                                        ? SizedBox()
                                        : Icon(Icons.line_weight),
                                    pokemonList[index].weight == null
                                        ? SizedBox()
                                        : Text("5cm"),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    pokemonList[index].height == null
                                        ? SizedBox()
                                        : Icon(Icons.height),
                                    pokemonList[index].height == null
                                        ? SizedBox()
                                        : Text("2m"),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PokemonDetailPage(
                        initialPage: index,
                        pokemonList: pokemonList,
                      ),
                    ),
                  );
                },
              );
            }));
  }
}

class Pokemon {
  String name;
  String description;
  String urlImage;
  String type;
  String? weight; //Este atributo es opcional
  String? height; //Este atributo es opcional

  Pokemon(
      {required this.name,
      required this.description,
      required this.urlImage,
      required this.type,
      this.weight,
      this.height});
}
