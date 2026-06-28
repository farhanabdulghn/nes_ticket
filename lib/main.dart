import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nes_ticket/app_routes.dart';
import 'package:nes_ticket/app_theme.dart';
import 'package:nes_ticket/config/env.dart';
import 'package:nes_ticket/pages/screens/splash_screen.dart';
import 'package:nes_ticket/storage/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  const environment = String.fromEnvironment(
    'environment',
    defaultValue: kReleaseMode ? Environment.prod : Environment.dev,
  );

  Environment.initConfig(environment);

  runApp(ProviderScope(retry: (retryCount, error) => null, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(context),
      routes: AppRoutes.routes,
      home: SplashScreen(),
    );
  }
}
