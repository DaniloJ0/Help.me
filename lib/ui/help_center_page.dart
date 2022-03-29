import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/appBar.dart';
import '../widgets/listItems.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
                children: [customAppBar(), Expanded(child: ListMenu())])));
  }
}

Widget ListMenu() {
  return ListView(children: [
    cards('Mujeres victimas de violencia', '155'),
    cards('Gaula – Antisecuestro', '165'),
    cards('Policía Nacional', '112'),
    cards('Defensa Civil', '144'),
    cards('Cruz Roja', '132'),
    cards('Bomberos', '119'),
    cards('Servicio de Ambulancias', '125'),
    cards('Atención a Desastres', '111'),
  ]);
}

Widget cards(nombre, numero) {
  return Card(
    child: ListTile(
    title: textos(numero, 19.0, FontWeight.w600),
    subtitle: textos(nombre, 14.0, FontWeight.w400),
  ));
}
