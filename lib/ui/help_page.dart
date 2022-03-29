import 'package:apphelpme/ui/app_info_page.dart';
import 'package:apphelpme/ui/contactenos_page.dart';
import 'package:apphelpme/ui/help_center_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/appBar.dart';
import '../widgets/listItems.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [
      customAppBar(),
      Expanded(
        child: ListMenu()
        )
      ])));
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
              onTap: ()=> Get.to(() => HelpCenterPage(), 
                  transition: Transition.leftToRight,
                  duration: const Duration(milliseconds: 450)),
              ),
      ListTile(
          leading: icons('herContact'),
          title: textos('Contactenos', 17.0, FontWeight.w500),
          subtitle: textos('Utilice estos medios para comunicarse con nosotros', 14.0,
              FontWeight.w400),
              onTap: ()=> Get.to(() => ContatenosPage(), 
                  transition: Transition.leftToRight,
                  duration: const Duration(milliseconds: 450))
              ),
      ListTile(
        leading: icons('info'),
        title: textos('App info', 17.0, FontWeight.w500),
        subtitle: textos(
            'Versión, creadores', 14.0, FontWeight.w400),
              onTap: ()=> Get.to(() => AppInfoPage(), 
                  transition: Transition.leftToRight,
                  duration: const Duration(milliseconds: 450))
      )]
    );
}


