import 'dart:math' as math;

import 'package:flutter/material.dart';

Color primaryColor = const Color(0xFF313649);
Color darkPrimaryColor = const Color(0xFF21242F);
Color signupButtonColor = const Color(0xFF28444E);
Color white = const Color(0xFFFFFFFF);
Color greyText = const Color(0xFF6B7594);
Color iconColor = const Color(0xFF757575);
Color bgColor = const Color(0xFF1E2429);
Color grey = const Color(0xFF95A1AC);
Color black = const Color(0xFF2B343A);
Color nameImageColor = const Color(0xFF6B19FF);
Color grey2 = const Color(0xFF98A2C0);
Color widgetTextColor = const Color(0xFFB0BCE0);
Color bgImageColor = const Color(0xFFEADFFD);
Color greenColor = const Color(0xFF4CCEB4);
Color lightGrey = const Color(0xFF454A64);
Color yellow = const Color(0xFFF1A41C);
Color red = const Color(0xFFDB504C);
Color darkBlue =const Color(0xFF182339);
Color lightGreen=const Color(0xFF4ED0B3);
Color bgGreen=const Color(0xFF061B1E);
Color calenderViolet=const Color (0xFF1A1728);
Color calenderVioletLight=const Color (0xFF9CA5F3);
Color lightVioletBgColor=const Color (0xFF2C2038);
Color lightestViolet=const Color(0xFFCA70FF);
Color greenCalender=const Color(0xFF133210);
Color lightGreenCalenderText=const Color(0xFF77C267);
Color redCalender =const Color(0xFF362325);
Color lightRedCalender =const Color(0xFFFE877D);
Color blueCalender=const Color(0xFF182339);
Color lightBlueCalender=const Color(0xFF16ACFC);

Color greenText = const Color(0xFF4CCEB4);
Color darkGrey = const Color(0xFF454A64);
Color avatarBgColor = const Color(0xFFF2C49A);
Color completeColor = const Color(0xFF50A979);
Color deleteColor = const Color(0xFFDB504C);
Color greyBG = const Color(0xFF292C3A);
Color greenSwitch = const Color(0xFF4CCEB4);
Color textBgColor = const Color(0xFF08495E);

Map<int, Color> color = {
  50: primaryColor.withOpacity(.1),
  100: primaryColor.withOpacity(.2),
  200: primaryColor.withOpacity(.3),
  300: primaryColor.withOpacity(.4),
  400: primaryColor.withOpacity(.5),
  500: primaryColor.withOpacity(.6),
  600: primaryColor.withOpacity(.7),
  700: primaryColor.withOpacity(.8),
  800: primaryColor.withOpacity(.9),
  900: primaryColor.withOpacity(1),
};
MaterialColor primaryColorMaterial = MaterialColor(0xFF313649, color);

Color getRandomColor() {
  return Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
}
int getRandomColorAsCode() {
  return (math.Random().nextDouble() * 0xFFFFFF).toInt();
}
Color getRandomColorCustom(){
  membersColors.shuffle();
  return membersColors.last;
}
List<Color> membersColors= [
  const Color(0xFFDB504C),
  const Color(0xFFFFFF00),
  const Color(0xFF50A979),
  const Color(0xFFFA1E9B),
  const Color(0xFFFFDB00),
  const Color(0xFF30FF00),
  const Color(0xFFFF0000),
  const Color(0xFF00FFF5),
  const Color(0xFFFFA100),
];