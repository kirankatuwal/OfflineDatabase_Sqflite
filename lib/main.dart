import 'package:custom_splash/custom_splash.dart';
import 'package:flutter/material.dart';
import 'package:offline/screens/homepage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.green)),
    home: CustomSplash(
      imagePath: 'assets/logo.png',
      backGroundColor: Colors.white,
      animationEffect: 'zoom-in',
      logoSize: 300,
      home: Homepage(),
      // customFunction: duringSplash,
      duration: 3000,
      type: CustomSplashType.StaticDuration,
    ),
  ));
}
