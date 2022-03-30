import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

void funcion(int saveorclear) {
  if (saveorclear == 1) {
    print("Mensaje Guardado");
  } else {
    if (saveorclear == 2) {
      print("Mensaje Reestablecido");
    }
  }
}

class _MessageState extends State<Message> {
  String _name = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.red,
        fontFamily: 'Arial',
      ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 245, 10, 10),
            centerTitle: true,
            title: const Text('Personalizar Mensaje'),
          ),
          body: SizedBox(
            height: 180,
            child: Column(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: _createInput(),
                )),
                Row(children: [
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: _createButton("Guardar",1)),
                  ),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: _createButton("Reestablecer",2)),
                  ),
                ])
              ],
            ),
          )),
    );
  }

  Widget _createInput() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          counter: Text('Longitud del mensaje: ${_name.length}'),
          hintText: 'Ayudame! Estoy en peligro!',
          labelText: 'Mensaje de Alerta',
          suffixIcon: Icon(Icons.warning),
          icon: Icon(Icons.add_alert_sharp)),
      onChanged: (value) {
        setState(() {
          _name = value;
        });
        //print(value);
      },
    );
  }

  Widget _createButton(String text,int op) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.red),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      onPressed: () => funcion(op),
    );
  }
}
