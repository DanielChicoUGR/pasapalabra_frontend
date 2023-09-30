import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';

final wordsProvider = Provider<Map<String, List<String>>>((ref) {
  return {
    "botella": [
      "Recipiente con cuello estrecho ...",
      "Liquido que cabe en una botella",
      "Recipiente cilindirco alargado y metalico usado para contener gases",
      "Medida de capacidad de ciertos liquidos"
    ],
    "tocón": [
      "Parte del tronco de un árbol que queda unida a la raíz cuando lo cortan por el pie",
      "Parte de un miembro cortado adherido al cuerpo",
      "(Coloquial), Aficionado a tocar..."
    ],
    "zapato": [
      "Calzado que no pasa del tobillo, con la parte inferior de la suela y lo demás de piel, fieltro..., mas o menos escotado por el empeine"
    ],
  };
});

// class _Diccionario extends

final _random = Provider<Random>((ref) {
  return Random(DateTime.now().hashCode);
});

final getRandomDefProvider = Provider.family<String?, String>((ref, palabra) {
  var dic = ref.watch(wordsProvider);
  final rand = ref.watch(_random);
  var a = dic[palabra];
  return a?[rand.nextInt(a.length)];
});

final getRandomWordProvider = Provider.family<String, int?>((ref, _) {
  final dic = ref.watch(wordsProvider);
  final rand = ref.watch(_random);

  return dic.keys.elementAt(rand.nextInt(dic.keys.length));
});

final getRandomNODefProvider =
    Provider.family<List<String>?, String>((ref, palabra) {
  // return null;
  var dic = ref.watch(wordsProvider);
  final rand = ref.watch(_random);
//
  if (!dic.containsKey(palabra)) return null;
//
  final keys = dic.keys;
  var nDefs = List<String>.empty(growable: true);
  int totalDefs = 0;
  for (var key in keys) {
    if (key != palabra) {
      nDefs.addAll(dic[key]!);
      totalDefs += dic[key]!.length;
    }
  }
//
  // var definiciones =
  //     List<int>.generate(3, (int index) => rand.nextInt(totalDefs));
//
  return List.generate(3, (index) => nDefs[rand.nextInt(totalDefs)]);
});
