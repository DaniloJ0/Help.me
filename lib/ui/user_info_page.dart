import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/listItems.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Usuario'),
          backgroundColor: const Color(0xffff2d55),
          centerTitle: true,
        ),
        body: Column(children: [
          Container(
            height: 125.0,
            child: headBar(), // Falta el boton de cambiar foto
          ),
          Expanded(
            flex: 4,
            child: ListMenu(context),
          ),
        ]));
  }
}

Widget ListMenu(context) {
  return ListView(
    children: [
      ListTile(
        leading: icons('contact'),
        title: textos('Nombre', 17.0, FontWeight.w500),
        subtitle: textos('Sofia Vergara', 14.0, FontWeight.w400),
        onTap: () => _showAlert(context),
      ),
      ListTile(
          leading: icons('herContact'),
          title: textos('Telefono', 17.0, FontWeight.w500),
          subtitle: textos('+57 3005069233', 14.0, FontWeight.w400),
          onTap: () => () {}),
    ],
  );
}

void _showAlert(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text('Escriba su nombre'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Escriba su nombre'
                ),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Aceptar'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                ;
              },
            ),
            TextButton(
              child: Text('Cancelar'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                ;
              },
            )
          ],
        );
      });
}

Widget headBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [circle(), iconChangePhoto()])
      ),
    ],
  );
}

Widget iconChangePhoto(){
  return InkWell(
    onTap: () => (){},
    child: Container(
              alignment: Alignment.bottomRight,
              width: 30.0,
              height: 30.0,
              child: const Padding(
                padding: EdgeInsets.all(2.5),
                child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('lib/assets/editProfile.png')),
              ),
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
  );
}

Widget circle(){
  return Container(
            alignment: Alignment.center,
            width: 90.0,
            height: 90.0,
            child: const CircleAvatar(
                radius: 70,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('lib/assets/sofia.png')),
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ));
}