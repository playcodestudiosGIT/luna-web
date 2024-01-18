import 'package:flutter/material.dart';
import 'package:luna_aconstruction/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/dialogs/apply_dialog.dart';
import '../widgets/home_widgets/footer.dart';
import '../widgets/home_widgets/header.dart';
import '../widgets/home_widgets/wrapper_services.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final language = Provider.of<SettingsProvider>(context).language;

    return SingleChildScrollView(
      child: Column(
        children: [
          const Header(),
          const SizedBox(height: 60),
          if (language == Language.en) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                  'Providing high quality services for our commercial and industrial clients',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
          ],
          if (language == Language.es) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                  'Brindar servicios de alta calidad a nuestros clientes comerciales e industriales.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium),
            ),
          ],
          const SizedBox(height: 60),
          const WrapperServices(),
          const SizedBox(height: 60),
          if (language == Language.en) ...[
            Text('Work With Us',
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                  'Join our team and be part of this nice and friendly inviroment, apply now.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge),
            )
          ],
          if (language == Language.es) ...[
            Text('Trabaja con nosotros',
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              constraints: const BoxConstraints(maxWidth: 800),
              child: Text(
                  'Únete a nuestro equipo y forma parte de este ambiente agradable y amigable, postule ahora.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge),
            )
          ],
          const SizedBox(height: 30),
          FilledButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => const ApplyDialog());
              },
              child: (language == Language.es)
                  ? const Text('APLICA YA')
                  : const Text('APPLY NOW')),
          const SizedBox(height: 60),
          const Footer(),
        ],
      ),
    );
  }
}
