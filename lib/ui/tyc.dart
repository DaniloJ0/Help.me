import 'package:flutter/material.dart';

import '../widgets/appBar.dart';
import '../widgets/listItems.dart';


class TyCPAGE extends StatelessWidget {
  @override
Widget build(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  return Scaffold(
    appBar: AppBar(
      title: Text("Terminos y Condiciones"),
    ),
    body: Container(
      width: width,
      child: Text(
        "Hi",
        textAlign: TextAlign.center,
      ),
    ),
  );
}
}
