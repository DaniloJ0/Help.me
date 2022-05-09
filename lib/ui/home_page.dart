import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_sms/flutter_sms.dart';

import 'menu_page.dart';

class HomePage extends StatelessWidget {
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
                  onPressed: () {
                   sending_SMS('Ayuda! me encuentro en peligro, te comparto mi ubicación', ['+573146347090', '+573145616716']);
                    // launch(
                    //     'sms:+57xxxxxxxxx?body=Ayuda! me encuentro en peligro, te comparto mi ubicación');
                  }, 
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
}

void sending_SMS(String msg, List<String> list_receipents) async {
  String send_result = await sendSMS(message: msg, recipients: list_receipents)
      .catchError((err) {
    print(err);
  });
  print(send_result);
}
