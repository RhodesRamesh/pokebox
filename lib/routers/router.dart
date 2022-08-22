import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedox/routers/routes.dart';
import 'package:pokedox/screens/home/home.dart';
import 'package:pokedox/screens/pokemonprofile/pokemonprofile.dart';

import '../screens/splashscreen/splashscreen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  return MaterialPageRoute(builder: (context) => const Splashscreen());
}

List<GetPage> getPages(){
  return [
    GetPage(name: splashScreenRoute, page: ()=>const Splashscreen()),
    GetPage(name: homeRoute, page: ()=>const Home()),
  ];
}
