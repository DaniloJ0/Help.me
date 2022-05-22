import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/listItems.dart';

class UserInfor extends StatefulWidget {
  @override
  State<UserInfor> createState() => _UserInforState();
}

class _UserInforState extends State<UserInfor> {
  var selected = 0;
  AssetImage imagenAvatar = AssetImage("lib/assets/noPhoto.png");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Usuario'),
          backgroundColor: const Color(0xffff2d55),
          centerTitle: true,
        ),
        body: Column(children: [
          //Circle Avatar
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 45.0, 0, 20.0),
            child: headBar(context),
          ),
          // Items
          Expanded(
            flex: 4,
            child: ListMenu(context),
          ),
        ]));
  }

  void changeavatar(s, ruta) {
    selected = s;
    setState(() {
      selected = s;
      imagenAvatar = AssetImage(ruta);
    });
  }

  Widget circleAvatar() {
    return Container(
        alignment: Alignment.center,
        width: 90.0,
        height: 90.0,
        child: CircleAvatar(
            radius: 70,
            backgroundColor: Colors.white,
            backgroundImage: imagenAvatar),
        decoration: const BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ));
  }

  Widget ListMenu(context) {
    final String email = FirebaseAuth.instance.currentUser!.email.toString();
    return ListView(
      children: [
        ListTile(
          leading: icons('contact'),
          title: textos('Email', 17.0, FontWeight.w500),
          subtitle: textos(email, 14.0, FontWeight.w400),
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
                      hintText: 'Escriba su nombre'),
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

  Widget headBar(_context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Stack(
                alignment: Alignment.bottomRight,
                children: [circleAvatar(), iconChangePhoto(_context)])),
      ],
    );
  }

  Widget iconChangePhoto(context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => Container(
            height: MediaQuery.of(context).size.height * 0.22,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(25.0),
                topRight: const Radius.circular(25.0),
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15.0, 5.0, 0),
                    child: avatars(1, 2, 3),
                  ),
                  Padding(
                     padding: const EdgeInsets.fromLTRB(0, 12.0, 0, 0),
                    child: avatars(4, 5, 6),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: const Icon(
        Icons.camera_alt,
        color: Colors.red,
        size: 18.0,
      ),
    );
  }

  Widget avatars(id1, id2, id3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage("lib/assets/u$id1.png"),
        ),
        avatarPositioned(id1),
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage("lib/assets/u$id2.png"),
        ),
        avatarPositioned(id2),
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage("lib/assets/u$id3.png"),
        ),
        avatarPositioned(id3),
      ],
    );
  }

  Widget avatarPositioned(id){
    return Positioned(
            bottom: 20,
            right: 5,
            child: InkWell(
              onTap: () {
                changeavatar(id, "lib/assets/u$id.png");
              },
              child: const Icon(
                Icons.check,
                color: Colors.red,
                size: 18.0,
              ),
            ));
  }

  
}

