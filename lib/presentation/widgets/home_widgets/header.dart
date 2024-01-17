import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/constants.dart';
import '../../../providers/settings_provider.dart';

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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (language == Language.en) ...[
                    const Text('• Plumbers'),
                    const Text('• Electricians'),
                    const Text('• Pipe Fitters'),
                    const Text('• Sheet Metal'),
                    const Text('• Control'),
                    const Text('• Welders'),
                    const Text('• And More')
                  ],
                  if (language == Language.es) ...[
                    const Text('• Plomeros'),
                    const Text('• Electricistas'),
                    const Text('• Instalador de tuberías'),
                    const Text('• Hojas de metal'),
                    const Text('• Control'),
                    const Text('• Soldadores'),
                    const Text('• Y Mas')
                  ],
                ],
              ),
              Column(
                children: [
                  if (language == Language.en) ...[
                    const Text(
                      'CONSTRUCTION',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text('WORKERS', style: TextStyle(fontSize: 30))
                  ],
                  if (language == Language.es) ...[
                    const Text(
                      'TRABAJADORES DE',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text('CONSTRUCCIÓN', style: TextStyle(fontSize: 30))
                  ],
                ],
              ),
            ],
          ),
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
