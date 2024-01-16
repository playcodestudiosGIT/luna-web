import 'package:flutter/material.dart';
import 'package:luna_aconstruction/config/constants.dart';
import 'package:luna_aconstruction/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/dialogs/apply_dialog.dart';

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
            Text('Construction, maintenance and repair services',
                style: Theme.of(context).textTheme.headlineMedium),
            Text('for your industry or commerce.',
                style: Theme.of(context).textTheme.headlineMedium)
          ],
          if (language == Language.es) ...[
            Text('Servicios de construcción, mantenimiento y reparación',
                style: Theme.of(context).textTheme.headlineMedium),
            Text('para su industria o comercio.',
                style: Theme.of(context).textTheme.headlineMedium)
          ],
          const SizedBox(height: 60),
          const WrapperServices(),
          const SizedBox(height: 60),
          if (language == Language.en) ...[
            Text('Work With Us',
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 15),
            Text(
                'If you have knowledge about plumbing, electricity, or any construction work, apply to work with us.',
                style: Theme.of(context).textTheme.bodyLarge)
          ],
          if (language == Language.es) ...[
            Text('Trabaja con nosotros',
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              constraints: const BoxConstraints(maxWidth: 800),
              child: Text(
                  'Si tienes conocimientos sobre plomería, electricidad o cualquier trabajo de construcción, postúlate para trabajar con nosotros.',
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
              child: (language == Language.es) ? const Text('APLICA YA') : const Text('APPLY NOW')),
          const SizedBox(height: 60),
          const Footer(),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final language = Provider.of<SettingsProvider>(context).language;
    return Container(
      width: double.infinity,
      height: 200,
      color: primaryColor,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 if (language == Language.en)
                ...[Text('Contact Us',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: bgColor)),
                Text('Luna A Construction',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: bgColor)),
                Text('Magna duis voluptate quis ex excepteur.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: bgColor)),
                Text('Phone: 555 - 55555555',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: bgColor))],
                        if (language == Language.es)
                ...[Text('Contáctanos',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: bgColor)),
                Text('Luna A Construction',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: bgColor)),
                Text('Magna duis voluptate quis ex excepteur.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: bgColor)),
                Text('Telf: 555 - 55555555',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: bgColor))]
              ]),
        ),
      ),
    );
  }
}

class WrapperServices extends StatelessWidget {
  const WrapperServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final language = Provider.of<SettingsProvider>(context).language;

    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      child: Wrap(
        spacing: 50,
        runSpacing: 50,
        children: [
          Container(
            width: 300,
            height: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: bgColor,
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://res.cloudinary.com/dyxt5lhzw/image/upload/v1705372270/luna-construction/plomeria_lx4r04.jpg'),
                    opacity: 0.2,
                    fit: BoxFit.cover)),
            child: Center(
                child: (language == Language.es) 
                ? Text('PLOMEROS',
                    style: Theme.of(context).textTheme.titleLarge)
                : Text('PLUMBERS',
                    style: Theme.of(context).textTheme.titleLarge)
              ),
          ),
          Container(
            width: 300,
            height: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: bgColor,
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://res.cloudinary.com/dyxt5lhzw/image/upload/v1705372426/luna-construction/images_waot9h.jpg'),
                    opacity: 0.2,
                    fit: BoxFit.cover)),
            child: Center(
                child: (language == Language.es) 
                ? Text('ELECTRICISTAS',
                    style: Theme.of(context).textTheme.titleLarge)
                : Text('ELECTRICIANS',
                    style: Theme.of(context).textTheme.titleLarge)
              ),
          ),
          Container(
            width: 300,
            height: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: bgColor,
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://res.cloudinary.com/dyxt5lhzw/image/upload/v1705372647/luna-construction/AdobeStock_439330480_x0pgr0.jpg'),
                    opacity: 0.2,
                    fit: BoxFit.cover)),
            child: Center(
                child: (language == Language.es) 
                ? Text('INSTALADOR DE TUBERÍAS',
                    style: Theme.of(context).textTheme.titleLarge)
                : Text('FITTERS PIPE',
                    style: Theme.of(context).textTheme.titleLarge)
                    ),
          ),
          Container(
            width: 300,
            height: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: bgColor,
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://res.cloudinary.com/dyxt5lhzw/image/upload/v1705429145/luna-construction/sheet-metal-worker-2-web-2018_mo1ro4.jpg'),
                    opacity: 0.2,
                    fit: BoxFit.cover)),
            child: Center(
                child: (language == Language.es) 
                ? Text('HOJAS METALICAS',
                    style: Theme.of(context).textTheme.titleLarge)
                : Text('SHEET METAL',
                    style: Theme.of(context).textTheme.titleLarge)
              ),
          ),
          Container(
            width: 300,
            height: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: bgColor,
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://res.cloudinary.com/dyxt5lhzw/image/upload/v1705373119/luna-construction/electrical-plc-control-panel_o9l4cx.jpg'),
                    opacity: 0.2,
                    fit: BoxFit.cover)),
            child: Center(
                child: (language == Language.es) 
                ? Text('CONTROLES',
                    style: Theme.of(context).textTheme.titleLarge)
                : Text('CONTROL',
                    style: Theme.of(context).textTheme.titleLarge)
            ),
          ),
          Container(
            width: 300,
            height: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: bgColor,
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://res.cloudinary.com/dyxt5lhzw/image/upload/v1705428985/luna-construction/welders_m5szbl.jpg'),
                    opacity: 0.2,
                    fit: BoxFit.cover)),
            child: Center(
                child: (language == Language.es) 
                ? Text('SOLDADORES',
                    style: Theme.of(context).textTheme.titleLarge)
                : Text('WELDERS',
                    style: Theme.of(context).textTheme.titleLarge)
              ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final language = Provider.of<SettingsProvider>(context).language;
    return Stack(
      alignment: Alignment.center,
      children: [
        const HeaderBg(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (language == Language.en)
                ...[const Text('• Plumbers'),
                const Text('• Electricians'),
                const Text('• Fitters Pipe'),
                const Text('• Sheet Metal'),
                const Text('• Control'),
                const Text('• Welders'),
                const Text('• And More')],
                if (language == Language.es)
                ...[const Text('• Plomeros'),
                const Text('• Electricistas'),
                const Text('• Instalador de tuberías'),
                const Text('• Hojas de metal'),
                const Text('• Control'),
                const Text('• Soldadores'),
                const Text('• Y Mas')],
              ],
            ),
            Column(
              children: [
                if (language == Language.en)
                ...[const Text(
                  'CONSTRUCTION',
                  style: TextStyle(fontSize: 30),
                ),
                const Text('WORKERS', style: TextStyle(fontSize: 50))],
                if (language == Language.es)
                ...[const Text(
                  'TRABAJADORES DE',
                  style: TextStyle(fontSize: 30),
                ),
                const Text('CONSTRUCCION', style: TextStyle(fontSize: 50))],
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class HeaderBg extends StatelessWidget {
  const HeaderBg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          SizedBox(width: wSize(context)),
          const Positioned(
            child: SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: NetworkImage(
                    'https://res.cloudinary.com/dyxt5lhzw/image/upload/v1705247029/luna-construction/bg1_y9dvwo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 300,
            child: Image(
              image: NetworkImage(
                  'https://res.cloudinary.com/dyxt5lhzw/image/upload/v1705247500/luna-construction/bgdiagonal_bw1qmf.png'),
            ),
          ),
          const Positioned(
            left: 70,
            child: SizedBox(
              height: 300,
              child: Image(
                image: NetworkImage(
                    'https://res.cloudinary.com/dyxt5lhzw/image/upload/v1705247310/luna-construction/barras_pneret.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
