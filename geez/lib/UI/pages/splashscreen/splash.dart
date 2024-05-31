// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geez/UI/pages/signin/login.dart';
import 'package:geez/helper/navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual);
    Future.delayed(const Duration(seconds: 6), () {
      changeScreenReplacement(context, const LoginScreen());
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.white],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo.jpg',
              height: 64,
            )
          ],
        ),
      ),
    );
  }
}
