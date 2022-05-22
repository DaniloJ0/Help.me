import 'package:flutter/material.dart';

Widget textos(text, fontSz, FontW) {
  return Text(text,
      style: TextStyle(
          fontSize: fontSz,
          fontFamily: 'Abhaya Libre SemiBold',
          fontWeight: FontW));
}

Widget icons(name) {
  return ImageIcon(AssetImage('lib/assets/$name.png'), size: 25);
}
