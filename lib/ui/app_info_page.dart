import 'package:flutter/material.dart';

import '../widgets/appBar.dart';
import '../widgets/listItems.dart';

class AppInfoPage extends StatelessWidget {
  const AppInfoPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App info'),
        backgroundColor: const Color.fromARGB(255, 245, 10, 10),
        centerTitle: true,
      ),
      body: SafeArea(
            child: Column(children: [
      // customAppBar(),
      Expanded(child: 
        listItems()
      )
    ])));
  }
}

Widget listItems(){
  return ListView(children: [
    items('Nombre de la app', 'Help.me'),
    items('Desarrollado ', 'Flutter (Dart)'),
    items('Fecha', '27/05/2022'),
    items('Plataformas', 'IOS/Android'),
    items('Origen', 'Uninorte'),
    items('Versión', '1.0.0'),
  ]);
}

Widget items(dato1,dato2) {
  return Card(child: ListTile(
    title: textos(dato1, 16.0, FontWeight.w500),
    subtitle: textos(dato2, 14.0, FontWeight.w400),
  )
  );
}
