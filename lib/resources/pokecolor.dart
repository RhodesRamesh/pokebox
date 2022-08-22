import 'package:flutter/material.dart';

import 'color.dart';

class PokeColor {
  static Color fire = const Color(0xFFfa7e25);
  static Color grass = const Color(0xFF48d0b0);
  static Color electric = const Color(0xFFfcce4b);
  static Color water = const Color(0xFF76bdfe);
  static Color bug = const Color(0xFF729f3f);
  static Color poison = const Color(0xFFb97fc9);
  static Color fairy = const Color(0xFFfdb9e8);
  static Color fighting = const Color(0xFFd56723);
  static Color psychic = const Color(0xFFf466ba);
  static Color rock = const Color(0xFFa28c21);
  static Color steel = const Color(0xFF9eb7b8);
  static Color ghost = const Color(0xFF7b61a3);
  static Color ground = const Color(0xff816d04);
  static Color flying = const Color(0xffc0b1f5);
  static Color dragon = const Color(0xfff16e57);
  static Color dark = const Color(0xff707070);
  static Color ice = const Color(0xff51c5e7);

  Color getPokeColor(String type) {
    switch (type.toLowerCase()) {
      case 'fire':
        return fire;
      case 'grass':
        return grass;
      case 'electric':
        return electric;
      case 'water':
        return water;
      case 'bug':
        return bug;
      case 'poison':
        return poison;
      case 'fairy':
        return fairy;
      case 'fighting':
        return fighting;
      case 'psychic':
        return psychic;
      case 'rock':
        return rock;
      case 'steel':
        return steel;
      case 'ghost':
        return ghost;
      case 'ground':
        return ground;
      case 'flying':
        return flying;
      case 'dragon':
        return dragon;
      case 'dark':
        return dark;
      case 'ice':
        return ice;
      default:
        return grey;
    }
  }
}
