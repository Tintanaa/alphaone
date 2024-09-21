import 'package:alphaone/core/configs/assets/app_vectors.dart';
import 'package:alphaone/presentation/intro/pages/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          AppVectors.logo,
        ),
      ),
    );
  }

  Future<void> redirect() async {
    await Future<void>.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const GetStartedPage(),
      ),
    );
  }
}
