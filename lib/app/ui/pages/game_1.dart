// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:pasapalabra_trainer_app/app/providers/providers.dart';
import 'package:pasapalabra_trainer_app/app/ui/widgets/change_theme_button.dart';

// class DefToWordTest extends ConsumerWidget {
//   const DefToWordTest({super.key});

//   // late var _def;
//   // late List<String> _def;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var palabra = useState(ref.read(getRandomWordProvider(null)));
//     // var definiciones = List<String>.filled(4, "", growable: true);
//     List<String>? def = ref.read(getRandomNODefProvider(palabra.value));
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         automaticallyImplyLeading: true,
//         // backgroundColor: Theme.of(context).appBarTheme.foregroundColor,
//         title: const Row(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Icon(Icons.book_rounded),
//             Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Text("Definición -> Palabra")),
//             Icon(Icons.book_outlined)
//             // ImageIcon(AssetImage(context.assets.icons.dictionary_png)),
//           ],
//         ),
//         actions: const [ChangeThemeButton()],
//       ),
//       body: Column(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: Theme.of(context).colorScheme.inversePrimary,
//               shape: BoxShape.circle,
//             ),
//             child: Text(palabra.value),
//           ),
//           ListView.builder(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             itemCount: def?.length ?? 0,
//             itemBuilder: (context, index) => Container(
//               decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.inversePrimary,
//                 shape: BoxShape.circle,
//               ),
//               child: Text(def!.elementAt(index)),
//             ),
//           )
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           palabra.value = ref.read(getRandomWordProvider(null));
//         },
//       ),
//     );
//   }
// }

class DefToWordTest extends ConsumerStatefulWidget {
  const DefToWordTest({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DefToWordTestState();
}

class _DefToWordTestState extends ConsumerState<DefToWordTest> {
  late String _palabra;
  late List<String>? _defs;

  @override
  void initState() {
    super.initState();
    _getWordDefs();
  }

  @override
  void dispose() {
    _defs?.clear();
    super.dispose();
  }

  void _getWordDefs() {
    _palabra = ref.read(getRandomWordProvider(null));
    _defs = ref.read(getRandomNODefProvider(_palabra));
    _defs?.add(ref.read(getRandomDefProvider(_palabra))!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        // backgroundColor: Theme.of(context).appBarTheme.foregroundColor,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.book_rounded),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("Definición -> Palabra")),
            Icon(Icons.book_outlined)
            // ImageIcon(AssetImage(context.assets.icons.dictionary_png)),
          ],
        ),
        actions: const [ChangeThemeButton()],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              shape: BoxShape.circle,
            ),
            child: Text(_palabra),
          ),
          ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: _defs?.length ?? 0,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                shape: BoxShape.circle,
              ),
              child: Text(_defs!.elementAt(index)),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _getWordDefs()),
      ),
    );
  }
}
