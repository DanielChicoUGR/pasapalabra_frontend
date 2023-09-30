import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pasapalabra_trainer_app/app/providers/routes.dart';
import 'package:pasapalabra_trainer_app/app/utils/theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkmodeProvider);
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: kDebugMode,
      routerConfig: router,
      title: 'Flutter Demo',
      
      // th
      theme: AppTheme(isDarkmode: isDarkMode).getTheme(),
      // home: const HomePage(),
    );
  }
}
