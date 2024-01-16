import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:luna_aconstruction/api/luna_api.dart';
import 'package:luna_aconstruction/config/theme/app_theme.dart';
import 'package:luna_aconstruction/router/app_router.dart';
import 'package:provider/provider.dart';

import 'providers/settings_provider.dart';

void main() async {
  LunaApi.configureDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        title: 'Luna A Construction',
        scrollBehavior: MyCustomScrollBehavior(),
        theme: AppTheme().getTheme(),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
