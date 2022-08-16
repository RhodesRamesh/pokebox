import 'package:flutter/material.dart';

import '../screens/splashscreen/splashscreen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  return MaterialPageRoute(builder: (context) => const Splashscreen());
}
