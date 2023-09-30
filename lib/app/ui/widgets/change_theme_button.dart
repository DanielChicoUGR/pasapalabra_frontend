import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:pasapalabra_trainer_app/app/utils/theme.dart'
    show isDarkmodeProvider;

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final dark = ref.watch(isDarkmodeProvider);
        return IconButton(
          // icon: const Icon( Icons.light_mode_outlined, size: 100 ),
          icon: (dark)
              ? const Icon(Icons.dark_mode_outlined)
              : const Icon(Icons.light_mode_outlined),
          onPressed: () {
            ref.read(isDarkmodeProvider.notifier).update((state) => !state);
          },
        );
      },
    );
  }
}
