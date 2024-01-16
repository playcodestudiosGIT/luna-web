import 'package:flutter/material.dart';
import 'package:luna_aconstruction/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import '../views/home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final language = Provider.of<SettingsProvider>(context).language;

    return Scaffold(
      appBar: AppBar(
        // toolbarHeight: 100,
        title: const Image(
            image: NetworkImage(
                'https://res.cloudinary.com/dyxt5lhzw/image/upload/v1705247765/luna-construction/logoh_iawsgg.png'),
            width: 150),
        actions: [
          ElevatedButton(
              onPressed: () {
                if (language == Language.en) {
                  Provider.of<SettingsProvider>(context, listen: false).language = Language.es;
                } else {
                  Provider.of<SettingsProvider>(context, listen: false).language = Language.en;
                }
              },
              child: Row(
                children: [
                  const Icon(Icons.language),
                  const SizedBox(width: 10),
                  (language == Language.en)
                      ? const Text('ES')
                      : const Text('EN')
                ],
              )),
          const SizedBox(width: 15)
        ],
      ),
      body: const HomeView(),
    );
  }
}
