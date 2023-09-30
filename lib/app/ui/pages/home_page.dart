import 'package:flutter/material.dart';
import 'package:pasapalabra_trainer_app/app/ui/widgets/change_theme_button.dart';
import 'package:pasapalabra_trainer_app/app/ui/widgets/tarjeta_paginas.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dictionary Master"),
        actions: const [
          ChangeThemeButton(),
        ],
        automaticallyImplyLeading: false,
        centerTitle: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return SizedBox.square(
              dimension: constraints.maxWidth * 3 / 4,
              child: const Placeholder(),
            );
          }),
          const TarjetaJuego(
            nombreMostrar: "Juego",
            nombreRuta: "game",
          ),
          const TarjetaJuego(
            nombreMostrar: "Estadisticas",
            nombreRuta: "stats",
          )
        ],
      ),
    );
  }
}
