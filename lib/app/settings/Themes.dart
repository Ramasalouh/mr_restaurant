import 'package:flutter/material.dart';

class OwnColors {
  static const Color firstColor = Color.fromRGBO(99, 10, 16, 1);
  static const Color secondColor = Color.fromRGBO(223, 46, 56, 1);
  static const Color thirdColor = Color.fromRGBO(28, 103, 88, 1);
}

//Rama Salouh

TextStyle texty(
    {required double size,
    Color color = Colors.black,
    FontWeight weight = FontWeight.normal}) {
  return TextStyle(
    fontFamily: 'Raleway',
    fontSize: size,
    color: color,
    fontWeight: weight,
  );
}

TextStyle texty1(
    {required double size,
    Color color = Colors.black,
    FontWeight weight = FontWeight.normal}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: weight,
  );
}

Size media(BuildContext context) {
  return MediaQuery.of(context).size;
}
