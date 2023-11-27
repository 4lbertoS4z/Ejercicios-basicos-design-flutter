import 'package:flutter/material.dart';

import 'ListPokemon.dart';

class PokemonFormScreen extends StatelessWidget {
  final Function(Pokemon) onFormSubmit;

  PokemonFormScreen({required this.onFormSubmit});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulario de Registro',
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Formulario de Registro'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://i.pinimg.com/originals/a1/86/a8/a186a8aff83506c70b0b307e3fb062c8.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              // Este padding empuja el contenido del formulario hacia abajo, debajo de la AppBar.
              padding: EdgeInsets.only(
                  top: kToolbarHeight +
                      20), // kToolbarHeight es la altura por defecto de la AppBar.
              child: RegistrationForm(onFormSubmit: onFormSubmit),
            ),
          ],
        ),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  final Function(Pokemon) onFormSubmit;

  RegistrationForm({required this.onFormSubmit});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nombre del Pokémon',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa el nombre del Pokémon';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _typeController,
              decoration: InputDecoration(
                labelText: 'Tipo de Pokémon',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa el tipo del Pokémon';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Descripción del Pokémon',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa una descripción del Pokémon';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _heightController,
              decoration: InputDecoration(
                labelText: 'Altura del Pokémon',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa la altura del Pokémon';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _weightController,
              decoration: InputDecoration(
                labelText: 'Peso del Pokémon',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa el peso del Pokémon';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _imageUrlController,
              decoration: InputDecoration(
                labelText: 'URL de la Imagen del Pokémon',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa la URL de la imagen del Pokémon';
                }
                // Validación simple de la URL
                if (!Uri.parse(value).isAbsolute) {
                  return 'Por favor ingresa una URL válida';
                }
                return null;
              },
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final newPokemon = Pokemon(
                    name: _nameController.text,
                    type: _typeController.text,
                    description: _descriptionController.text,
                    height: _heightController.text,
                    weight: _weightController.text,
                    urlImage: _imageUrlController.text,
                  );
                  widget.onFormSubmit(newPokemon);
                  // Cierra la pantalla del formulario para volver a la lista
                  Navigator.pop(context);
                }
              },
              child: Text('Registrar Pokémon'),
            ),
          ],
        ),
      ),
    );
  }
}
