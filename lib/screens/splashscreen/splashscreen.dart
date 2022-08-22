import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedox/resources/color.dart';
import 'package:pokedox/routers/routes.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [white, grey])),
        child: Center(
            child: Image.asset(
          'assets/pokemon-logo-new.png',
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 0.85,
        )),
      ),
    );
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),(){
      Get.offNamed(homeRoute);
    });
    super.initState();
  }
}
