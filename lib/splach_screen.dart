import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override

  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  Widget build(BuildContext context){
    return AnimatedSplashScreen(
      splash: 'assets/logo.png',
      nextScreen: const HomePage(),
      splashIconSize: 2000,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      );
  }
}

