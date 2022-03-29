import 'package:flutter/material.dart';

import '../widgets/appBar.dart';
import '../widgets/listItems.dart';

class ContatenosPage extends StatelessWidget {
  const ContatenosPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [
      customAppBar(),
      Expanded(child: 
        listItems()
      )
      ])));
  }
}

Widget listItems(){
  return ListView(children: [
    items('Correo', 'atencion-cliente@help-me.co'),
    items('Pagina Web', 'www.help-me.com'),
    items('Instagram', '@helpme_co'),
    items('Twitter', '@helpme_co')
  ]);
}

Widget items(dato1,dato2) {
  return Card(
    child: ListTile(
    title: textos(dato1, 16.0, FontWeight.w500),
    subtitle: textos(dato2, 14.0, FontWeight.w400),
    )
  );
}