import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Help.me',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Help.me'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
        title: Text(widget.title),
      ),
      body: Center(
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
                  style: TextStyle(color: Colors.white, fontSize: 60),
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
            const Text('Su ubicación actual es:',
                style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('Uninorte, Barranquilla', style: TextStyle(fontSize: 20)),
          ],
        ),
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
