import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MaterialButton(
            color: Colors.red,
            shape: const CircleBorder(),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.all(100),
              child: Text(
                'HELP',
                style: TextStyle(color: Colors.white, fontSize: 60, fontFamily: 'Suez One'),
              ),
            ),
          ),
          SizedBox(height: 20),
          MaterialButton(
            child: Icon(Icons.create_sharp),
            onPressed: () {
              _showAlert(context);
            },
          ),
          SizedBox(height: 90),
          const Text('Presione el botón para pedir ayuda',
              style: TextStyle(fontSize: 20)),
          SizedBox(height: 40),
          const Text('Su ubicación actual es:', style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          Text('Uninorte, Barranquilla', style: TextStyle(fontSize: 20)),
        ],
      ),
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
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
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
}
