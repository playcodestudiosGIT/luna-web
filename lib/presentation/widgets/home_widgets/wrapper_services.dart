import 'package:flutter/material.dart';
import 'package:luna_aconstruction/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import '../shared/card_service.dart';

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
          CardService(
            language: language,
            textEn: 'PLUMBERS',
            textEs: 'PLOMEROS',
            imgUrl:
                'https://res.cloudinary.com/dyxt5lhzw/image/upload/v1705372270/luna-construction/plomeria_lx4r04.jpg',
          ),
          CardService(
              language: language,
              imgUrl:
                  'https://res.cloudinary.com/dyxt5lhzw/image/upload/v1705372426/luna-construction/images_waot9h.jpg',
              textEn: 'ELECTRICIANS',
              textEs: 'ELECTRICISTAS'),
          CardService(
              language: language,
              imgUrl:
                  'https://res.cloudinary.com/dyxt5lhzw/image/upload/v1705372647/luna-construction/AdobeStock_439330480_x0pgr0.jpg',
              textEn: 'PIPE FITTERS',
              textEs: 'INSTALADOR DE TUBERÍAS'),
          CardService(
              language: language,
              imgUrl:
                  'https://res.cloudinary.com/dyxt5lhzw/image/upload/v1705429145/luna-construction/sheet-metal-worker-2-web-2018_mo1ro4.jpg',
              textEn: 'SHEET METAL',
              textEs: 'HOJAS METALICAS'),
          CardService(
              language: language,
              imgUrl:
                  'https://res.cloudinary.com/dyxt5lhzw/image/upload/v1705373119/luna-construction/electrical-plc-control-panel_o9l4cx.jpg',
              textEn: 'CONTROL',
              textEs: 'CONTROLES'),
          CardService(
              language: language,
              imgUrl:
                  'https://res.cloudinary.com/dyxt5lhzw/image/upload/v1705428985/luna-construction/welders_m5szbl.jpg',
              textEn: 'WELDERS',
              textEs: 'SOLDADORES')
        ],
      ),
    );
  }
}