// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pasapalabra_trainer_app/app/providers/logger_provider.dart';

class TarjetaJuego extends StatelessWidget {
  final String? _imagen;
  final String _nombreMostrar;
  final String _nombreRuta;

  const TarjetaJuego({
    Key? key,
    String? imagen,
    required nombreMostrar,
    required nombreRuta,
  })  : _imagen = imagen,
        _nombreMostrar = nombreMostrar,
        _nombreRuta = nombreRuta,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget widgetImagen = (_imagen != null)
        ? Image.asset(
            _imagen!,
            fit: BoxFit.cover,
          )
        : const Placeholder();
    return GestureDetector(
      onTap: () {
        loggerProvider.finest("Boton presionado");
        try {
          context.pushNamed(_nombreRuta);
        } catch (e) {
          loggerProvider.finest(e);
        }
      },
      child: Card(
        color: Theme.of(context).cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Column(
          children: [
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) =>
                  SizedBox(
                height: constraints.maxWidth * 0.25,
                child: Stack(
                  children: <Widget>[
                    // TODO: Eliminar Layoutbuilder, dejar imagen solo. Encontrar imagenes
                    SizedBox(
                      width: constraints.maxWidth,
                      child: const Text(
                        "Imagen Sugerente",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Positioned.fill(child: widgetImagen),
                  ],
                ),
              ),
            ),
            Text(
              _nombreMostrar, // getNombre(),
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

// const Spacer(),
// ButtonBar(
//   children: [
//     TextButton(
//       onPressed: () {
//         context.pushNamed(nombreRuta);
//       },
//       child: Text(
//         "Continuar",
//         style: Theme.of(context).textTheme.titleMedium,
//       ),
//     ),
//     TextButton(
//       onPressed: () async {
//          (ayuda != null)
//          ? await showDialog(
//          builder: (context) => ayuda!,
//          context: context,
//          )
//          : null;
//       },
//       child: Text(
//         "Ayuda",
//         style: Theme.of(context).textTheme.titleMedium,
//       ),
//     ),
//   ],
// ),
