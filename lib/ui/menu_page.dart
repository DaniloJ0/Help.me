import 'package:apphelpme/ui/user_info_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/listItems.dart';
import 'contacts_page.dart';
import 'help_page.dart';
import 'message.dart';
import 'terms_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
        backgroundColor: const Color.fromARGB(255, 245, 10, 10),
        centerTitle: true,
      ),
      body:Column(children: [
        // customAppBar(),
        Container(
          height: 125.0,
          child: headBar(),
        ),
        Expanded(
          flex: 4,
          child: ListMenu(),
        ),
        const Expanded(
            child: Center(
                child: Text(
          'Help.me',
          style: TextStyle(
              fontFamily: 'Abhaya Libre SemiBold',
              fontSize: 16,
              fontWeight: FontWeight.w600),
        )))
      ]),
    );
  }
}

  Widget ListMenu(){
    return ListView(
      children: [
        ListTile(
          leading: icons('contact'),
          title: textos('Usuario', 17.0, FontWeight.w500),
          subtitle: textos(
              'Editar nombre, cambiar foto de perfil', 14.0, FontWeight.w400),
          onTap: () => Get.to(()=>UserInfo(), 
                  transition: Transition.leftToRight,
                  duration: const Duration(milliseconds: 450))),
        ListTile(
            leading: icons('herCoNtact'),
            title: textos('Contactos', 17.0, FontWeight.w500),
            subtitle: textos('Editar lista de contactos, mostrar lista', 14.0,
                FontWeight.w400),
            onTap: () => Get.to(()=> Contacts(), 
                  transition: Transition.leftToRight,
                  duration: const Duration(milliseconds: 450))),
        ListTile(
            leading: icons('editMessage'),
            title:
                textos('Personalizar mensaje de alerta', 17.0, FontWeight.w500),
            subtitle: textos(
                'Editar mensaje, editar notificaciones', 14.0, FontWeight.w400),
            onTap: () => Get.to(()=> Message(), 
                  transition: Transition.leftToRight,
                  duration: const Duration(milliseconds: 450))),
        ListTile(
            leading: icons('terminos'),
            title: textos('Térrminos y condiciones', 17.0, FontWeight.w500),
            subtitle: textos(
                'Terminos y politica de privacidad', 14.0, FontWeight.w400),
            onTap: () => Get.to(() => TermsPage(), 
                  transition: Transition.leftToRight,
                  duration: const Duration(milliseconds: 450))),
        ListTile(
            leading: icons('ayuda'),
            title: textos('Ayuda', 17.0, FontWeight.w500),
            subtitle: textos('Centro de ayuda, contactenos, app info', 14.0,
                FontWeight.w400),
            onTap: () => Get.to(() => HelpPage(), 
                  transition: Transition.leftToRight,
                  duration: const Duration(milliseconds: 450))
                ),
      ],
    );
  }


Widget customAppBar() {
  return Row(
    children: [Expanded(flex: 1, child: appBar())],
  );
}

Widget appBar() {
  return Container(
      color: Colors.red,
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ));
}

Widget headBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Container(
              alignment: Alignment.center,
              width: 75.0,
              height: 75.0,
              child: const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('lib/assets/sofia.png')),
              decoration: const BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.circle,
              ))),
      Padding(
          padding: const EdgeInsets.all(0.0),
          child: Material(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.red,
              child: Container(
                width: 180.0,
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13.0),
                  child: Container(
                      color: const Color.fromARGB(255, 252, 243, 243),
                      child: const Padding(
                          padding: EdgeInsets.fromLTRB(10, 7, 0, 0),
                          child: Text(
                            'Sofia Vergara\n+57 3037895496',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'Sunflower',
                              fontWeight: FontWeight.w600,
                            ),
                          ))),
                ),
              )))
    ],
  );
}
