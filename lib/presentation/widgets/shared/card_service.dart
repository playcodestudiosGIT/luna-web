import 'package:flutter/material.dart';
import 'package:luna_aconstruction/config/constants.dart';

import '../../../providers/settings_provider.dart';

class CardService extends StatelessWidget {
  const CardService({
    super.key,
    required this.language,
    required this.imgUrl,
    required this.textEn,
    required this.textEs,
  });

  final Language language;
  final String imgUrl;
  final String textEn;
  final String textEs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 170,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            SizedBox(
              width: 300,
              height: 170,
              child: Image(
                image: NetworkImage(imgUrl),
                fit: BoxFit.cover,
              ),
            ),
            Container(width: 300, height: 170, color: bgColor.withOpacity(0.7)),
            Center(
                child: (language == Language.es)
                    ? Text(textEs,
                        style: Theme.of(context).textTheme.titleLarge)
                    : Text(textEn,
                        style: Theme.of(context).textTheme.titleLarge)),
          ],
        ),
      ),
    );
  }
}