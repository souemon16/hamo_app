import 'dart:async';
import 'package:flutter/material.dart';

import 'package:hamo_app/presentation/resources/assets_manager.dart';
import 'package:hamo_app/presentation/resources/color_manager.dart';
import 'package:hamo_app/presentation/resources/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //Set timer for Splash Screen
  Timer? _timer;
  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNextPage);
  }

  _goNextPage() {
    Navigator.pushReplacementNamed(context, Routes.onboardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(
        child: Image(
          image: AssetImage(ImageAssets.splashLogo),
        ),
      ),
    );
  }
}
