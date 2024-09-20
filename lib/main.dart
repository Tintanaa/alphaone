import 'package:alphaone/core/configs/theme/app_theme.dart';
import 'package:alphaone/presentation/splash/pages/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      home: const SplashPage(),
    );
  }
}
