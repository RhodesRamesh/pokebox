import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedox/resources/color.dart';
import 'package:pokedox/routers/router.dart' as route;
import 'package:pokedox/routers/routes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pokedox",
      theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
          primarySwatch: primaryColorMaterial, textSelectionTheme: TextSelectionThemeData(selectionColor: textBgColor)),
      onGenerateRoute: route.generateRoute,
      initialRoute: splashScreenRoute,
    );
  }
}
