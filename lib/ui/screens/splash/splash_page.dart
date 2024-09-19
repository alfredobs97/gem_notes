import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:gem_notes/ui/screens/home/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset(
        'assets/splash.png',
        fit: BoxFit.fill,
      ),
      nextScreen: const HomePage(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      splashIconSize: 1000,
    );
  }
}
