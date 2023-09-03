import 'package:flutter/foundation.dart';
//import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/locator.dart';
import 'app/theme.dart';
import 'ui/views/main/main_view.dart';

Future main() async {
  setPathUrlStrategy();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: StackedService.navigatorKey,
      title: 'Oghenekaro Edaware',
      debugShowCheckedModeBanner: false,
      home: const MainView(),
      themeMode: ((defaultTargetPlatform == TargetPlatform.iOS) ||
              (defaultTargetPlatform == TargetPlatform.android))
          ? ThemeMode.dark
          : ThemeMode.dark,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
