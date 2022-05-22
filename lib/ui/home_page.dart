import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:telephony/telephony.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';

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
                  onPressed: () => _sendSMS(), //_location(),
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
    var permission = await Permission.locationAlways.isGranted;
    var permission_msg = await Permission.sms.isGranted;
    if (!permission || !permission_msg) {
      var t = await Permission.locationAlways.request();
      var r = await Permission.sms.request();
    }
    // }else if(!permission_msg){
    //   var r = await Permission.sms.request();
    // }
    print('entra1');
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    String lat_lng =
        position.latitude.toString() + ',' + position.longitude.toString();
    String msg =
        '¡Ayuda! me encuentro en peligro, te comparto mi ubicación https://www.google.com/maps/search/?api=1&query=$lat_lng';
    List<String> listNumeros = ['+573146347090'];
    print('entra2');
    try {
      for (var i = 0; i < listNumeros.length; i++) {
        telephony.sendSms(
            to: listNumeros[i],
            message: msg,
            isMultipart:
                true); //'¡Ayuda! me encuentro en peligro, te comparto mi ubicación');
      }
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Mensajes enviados a tus contactos')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('¡Opp! Ocurrió un error, puede que no tengas saldo')));
    }
  }
}
