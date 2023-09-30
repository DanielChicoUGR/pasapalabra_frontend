import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'color_schemes.g.dart' show darkColorScheme, lightColorScheme;

const seedColor = Color.fromARGB(255, 0, 0, 255);

final isDarkmodeProvider = StateProvider<bool>((ref) {
  return false;
});

class AppTheme {
  final bool isDarkmode;

  AppTheme({required this.isDarkmode});

  ThemeData getTheme() => ThemeData.from(
        // useMaterial3: true,
        colorScheme: isDarkmode ? darkColorScheme : lightColorScheme,
      );
}
