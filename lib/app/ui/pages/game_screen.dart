import 'package:flutter/material.dart';
import 'package:pasapalabra_trainer_app/app/ui/widgets/change_theme_button.dart';
import 'package:pasapalabra_trainer_app/app/ui/widgets/tarjeta_paginas.dart';

class Game extends StatelessWidget {
  const Game({super.key});

  static const List<(String, String, String?)> juegos = [
    // * Format:
    // * <Name of the game>, <Name of the route of the game>, <Image that shows a preview of the game>
    ("Definición->Palabra (Test)", "game1", null),
    ("Palabra -> Definición (Test)", "game2", null),
    ("Definición->Palabra (Escrito)", "game3", null),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarGame(),
        automaticallyImplyLeading: true,
        centerTitle: true,
        actions: const <Widget>[
          ChangeThemeButton(),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: List<Widget>.generate(
          juegos.length,
          (index) => TarjetaJuego(
            nombreMostrar: juegos[index].$1,
            nombreRuta: juegos[index].$2,
            imagen: juegos[index].$3,
          ),
          growable: false,
        ),
      ),
    );
  }
}

class AppBarGame extends StatelessWidget {
  const AppBarGame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(Icons.book_rounded),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text("Juego")),
        Icon(Icons.book_outlined)
        // ImageIcon(AssetImage(context.assets.icons.dictionary_png)),
      ],
    );
  }
}
