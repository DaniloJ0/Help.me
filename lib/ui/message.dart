import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Message extends StatefulWidget {
  Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  String _name = '';
  final msgHolder = TextEditingController();

  void funcion(int saveorclear) {
    if (saveorclear == 1) {
      //Guardar el mensaje
    } else {
      if (saveorclear == 2) {
        setState(() {
          _name = 'Ayudame! Estoy en peligro!';
          msgHolder.clear();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffff2d55),
          centerTitle: true,
          title: const Text('Personalizar Mensaje'),
        ),
        body: SizedBox(
          height: 250,
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
                      child: _createButton("Guardar", 1)),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      child: _createButton("Reestablecer", 2)),
                ),
                //Mensaje actual
              ]),
              Container(
                  child: const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text("El mensaje de alerta actual es:"),
              )),
              Container(
                  child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(_name),
              )),
            ],
          ),
        ));
  }

  Widget _createInput() {
    return TextField(
      //autofocus: true,
      controller: msgHolder,
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
      },
    );
  }

  Widget _createButton(String text, int op) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.red),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      onPressed: () => funcion(op),
    );
  }
}
