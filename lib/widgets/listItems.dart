import 'package:flutter/material.dart';

Widget textos(text, fontSz, FontW) {
  return Text(text,
      style: TextStyle(
          fontSize: fontSz,
          fontFamily: 'Abhaya Libre SemiBold',
          fontWeight: FontWeight.w400));
}

Widget icons(name) {
  return CircleAvatar(
      radius: 13,
      backgroundColor: Colors.white,
      backgroundImage: AssetImage('lib/assets/${name}.png'));
}