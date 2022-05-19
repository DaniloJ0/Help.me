import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telephony/telephony.dart';

import 'menu_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Telephony telephony = Telephony.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffff2d55),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                Get.to(() => MenuPage());
              },
            )
          ],
          title: const Text('Help.me'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: MaterialButton(
                  color: Color(0xffff2d55),
                  shape: const CircleBorder(),
                  onPressed: () => _sendSMS(),
                  child: const Padding(
                    padding: EdgeInsets.all(40),
                    child: Text(
                      'HELP',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontFamily: 'Suez One'),
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      const Text(
                          'Presione el botón para\n         pedir ayuda\n',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                      const Text('Su ubicación actual es:',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                      const Text('Uninorte, Barranquilla',
                          style: TextStyle(fontSize: 20)),
                    ],
                  ))
            ],
          ),
        ));
  }

  _sendSMS() async {
    List<String> list_numeros = ['+573146347090'];
    try {
      for (var i = 0; i < list_numeros.length; i++) {
        telephony.sendSms(
          to: '${list_numeros[i]}',
          message: '¡Ayuda! me encuentro en peligro, te comparto mi ubicación');
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Mensajes enviados a tus contactos')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('¡Opp! Ocurrió un error, puede que no tengas saldo')));
    }
  }
}
