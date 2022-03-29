import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/appBar.dart';
import '../widgets/listItems.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      customAppBar(),
      Expanded(
        child: ListMenu()
        )
      ]);
  }
}

Widget ListMenu() {
  return ListView(
    children: [
      ListTile(
          leading: icons('atencionClient'),
          title: textos('Centro de ayuda', 17.0, FontWeight.w500),
          subtitle: textos(
              'Números de emergencia', 14.0, FontWeight.w400),
              onTap: ()=> (){},
              ),
      ListTile(
          leading: icons('herContact'),
          title: textos('Contactenos', 17.0, FontWeight.w500),
          subtitle: textos('Utilice estos medios para comunicarse con nosotros', 14.0,
              FontWeight.w400),
              onTap: ()=> (){}
              ),
      ListTile(
        leading: icons('info'),
        title: textos('App info', 17.0, FontWeight.w500),
        subtitle: textos(
            'Versión, creadores', 14.0, FontWeight.w400),
              onTap: ()=> (){}
      )]
    );
}


