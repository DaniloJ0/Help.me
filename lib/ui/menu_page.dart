import 'package:apphelpme/ui/login_page.dart';
import 'package:apphelpme/ui/user_info_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/listItems.dart';
import 'contacts_page.dart';
import 'help_page.dart';
import 'message.dart';
import 'terms_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MenuPage extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  MenuPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
        backgroundColor: const Color(0xffff2d55),
        centerTitle: true,
      ),
      body: Column(children: [
        // customAppBar(),
        Container(
          height: 125.0,
          child: headBar(),
        ),
        Expanded(
          flex: 4,
          child: ListMenu(context),
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

  Widget ListMenu(context) {
    return ListView(
      children: [
        ListTile(
            leading: icons('contact'),
            title: textos('Usuario', 17.0, FontWeight.w500),
            subtitle: textos(
                'Editar nombre, cambiar foto de perfil', 14.0, FontWeight.w400),
            onTap: () => Get.to(() => UserInfor(),
                transition: Transition.leftToRight,
                duration: const Duration(milliseconds: 450))),
        ListTile(
            leading: icons('herContact'),
            title: textos('Contactos', 17.0, FontWeight.w500),
            subtitle: textos('Editar lista de contactos, mostrar lista', 14.0,
                FontWeight.w400),
            onTap: () => Get.to(() => Contacts(),
                transition: Transition.leftToRight,
                duration: const Duration(milliseconds: 450))),
        ListTile(
            leading: icons('editMessage'),
            title:
                textos('Personalizar mensaje de alerta', 17.0, FontWeight.w500),
            subtitle: textos(
                'Editar mensaje, editar notificaciones', 14.0, FontWeight.w400),
            onTap: () => Get.to(() => Message(),
                transition: Transition.leftToRight,
                duration: const Duration(milliseconds: 450))),
        ListTile(
            leading: icons('terminos'),
            title: textos('Términos y condiciones', 17.0, FontWeight.w500),
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
                duration: const Duration(milliseconds: 450))),
        ListTile(
            leading: icons('logout'),
            title: textos('Logout', 17.0, FontWeight.w500),
            onTap: () => _logOut(context))
      ],
    );
  }

  Future _logOut(context) async {
  await _firebaseAuth.signOut().then((value) => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SignInPage()),(route) => false)); 
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
    final String _email = FirebaseAuth.instance.currentUser!.email.toString();
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
                    backgroundImage: AssetImage('lib/assets/noPhoto.png')),
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
                  width: 200.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13.0),
                    child: Container(
                        color: const Color.fromARGB(255, 252, 243, 243),
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(10, 7, 0, 0),
                            child: Text(
                              _email,
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
}
