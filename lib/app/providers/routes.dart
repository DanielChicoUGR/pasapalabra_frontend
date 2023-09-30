import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pasapalabra_trainer_app/app/ui/pages/game_1.dart';
import 'package:pasapalabra_trainer_app/app/ui/pages/game_screen.dart';
import 'package:pasapalabra_trainer_app/app/ui/pages/home_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          name: "home",
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: "stats",
              name: "stats",
              // throw GoException("Unimplemented screen"),
              builder: (context, state) => throw UnimplementedError(),
            ),
            GoRoute(
                path: "game",
                name: "game",
                builder: (context, state) => const Game(),
                routes: [
                  GoRoute(
                    path: "defTest",
                    name: "game1",
                    builder: (context, state) => const DefToWordTest(),
                  ),
                  GoRoute(
                    path: "wordTest",
                    name: "game2",
                    builder: (context, state) =>
                        errorPage("Game2 Unimplemented"),
                  ),
                  GoRoute(
                    path: "defWrite",
                    name: "game3",
                    builder: (context, state) =>
                        errorPage("Game3 Unimplemented"),
                  ),
                ]
                // builder: (context, state) => throw UnimplementedError(),
                )
          ]),
    ],
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: errorPage(state.error.toString()),
    ),
    debugLogDiagnostics: kDebugMode,
  );
});

Scaffold errorPage(String error) {
  return Scaffold(
      appBar: AppBar(
        title: const Text("ERROR PAGE"),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Text(error),
      ));
}
