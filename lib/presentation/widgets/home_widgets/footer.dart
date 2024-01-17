import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/constants.dart';
import '../../../providers/settings_provider.dart';

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
                if (language == Language.en) ...[
                  Text('Contact Us',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: bgColor)),
                  Text('Luna A Construction',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: bgColor)),
                  Text('Aldry Palma',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: bgColor)),
                  Text('Phone: 9195812965',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: bgColor))
                ],
                if (language == Language.es) ...[
                  Text('Contáctanos',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: bgColor)),
                  Text('Luna A Construction',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: bgColor)),
                  Text('Aldry Palma',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: bgColor)),
                  Text('Telf: 9195812965',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: bgColor))
                ]
              ]),
        ),
      ),
    );
  }
}
