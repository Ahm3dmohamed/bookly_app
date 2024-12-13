import 'package:bookly/constants.dart';
import 'package:flutter/material.dart';

abstract class Styles {
  static const textStyle18 =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white);
  static const textStyle20 =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
  static const textStyle22 =
      TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white);
  static const textStyle24 =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white);
  static const textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w900,
    color: Colors.white,
    fontFamily: kGtSectraFine,
    letterSpacing: 1.2,
  );
  static const textStyle14 = TextStyle(
      fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white);

  static const textStyle16 =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white);
}

const TextStyle textStyle = TextStyle();
