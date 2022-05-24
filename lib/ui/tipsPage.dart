import 'package:apphelpme/ui/app_info_page.dart';
import 'package:apphelpme/ui/contactenos_page.dart';
import 'package:apphelpme/ui/help_center_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/listItems.dart';
import 'package:url_launcher/url_launcher.dart';

class TipPage extends StatelessWidget {
  const TipPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tips'),
        backgroundColor: const Color(0xffff2d55),
        centerTitle: true,
      ),
      body: SafeArea(child: Column(children: [
      // customAppBar(),
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
          leading: icons('info'),
          title: textos('Defensa personal 1', 17.0, FontWeight.w500),
          subtitle: textos(
              'Movimientos simples de defensa personal que toda mujer debe saber', 14.0, FontWeight.w400),
              onTap: ()=> launch("https://www.youtube.com/watch?v=3sad-WUVAIs&list=PLPrkSqYAH8OebCsp0Bf04skVWeeq92pzS&index=2&ab_channel=IstiloMartialArts")),
      ListTile(
          leading: icons('herContact'),
          title: textos('Defensa personal 2', 17.0, FontWeight.w500),
          subtitle: textos('Defensa contra ataque directo', 14.0,
              FontWeight.w400),
              onTap: ()=>  launch("https://www.youtube.com/watch?v=0iARKD6gEVI&list=PLPrkSqYAH8OebCsp0Bf04skVWeeq92pzS&index=6&ab_channel=YUGODefensaPersonal")),
      ListTile(
        leading: icons('info'),
        title: textos('Defensa personal 3', 17.0, FontWeight.w500),
        subtitle: textos(
            'Versión, creadores', 14.0, FontWeight.w400),
              onTap: ()=> launch("https://www.youtube.com/watch?v=-yUZDbCJ1KI&list=PLPrkSqYAH8OebCsp0Bf04skVWeeq92pzS&index=15&ab_channel=BrainyCrafts")),
      ListTile(
        leading: icons('info'),
        title: textos('App info', 17.0, FontWeight.w500),
        subtitle: textos(
            'Versión, creadores', 14.0, FontWeight.w400),
              onTap: ()=> launch("")),
      ListTile(
        leading: icons('info'),
        title: textos('App info', 17.0, FontWeight.w500),
        subtitle: textos(
            'Versión, creadores', 14.0, FontWeight.w400),
              onTap: ()=> launch("")),
      ListTile(
        leading: icons('info'),
        title: textos('App info', 17.0, FontWeight.w500),
        subtitle: textos(
            'Versión, creadores', 14.0, FontWeight.w400),
              onTap: ()=> launch("")),
      ListTile(
        leading: icons('info'),
        title: textos('App info', 17.0, FontWeight.w500),
        subtitle: textos(
            'Versión, creadores', 14.0, FontWeight.w400),
              onTap: ()=> launch("")),
      ListTile(
        leading: icons('info'),
        title: textos('App info', 17.0, FontWeight.w500),
        subtitle: textos(
            'Versión, creadores', 14.0, FontWeight.w400),
              onTap: ()=> launch("")),
     
      ]
    );
}



