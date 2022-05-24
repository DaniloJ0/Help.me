import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Message extends StatefulWidget {
  Message({Key? key}) : super(key: key);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  late String _name = '';
  final msgHolder = TextEditingController();

  late SharedPreferences prefs;

  _initMsg() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('msg') ?? 'Ayuda! Estoy en peligro!';
    });
  }

  @override
  void initState() {
    _initMsg();
    super.initState();
  }

  void funcion(int saveorclear, String value) async {
    if (saveorclear == 1) {
      setState(() {
        _name = value;
      });
      await prefs.setString('msg', _name);
    } else {
      if (saveorclear == 2) {
        setState(() {
          _name = 'Ayudame! Estoy en peligro!';
          msgHolder.clear();
        });
        await prefs.setString('msg', _name);
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
                      child: _createButton("Guardar", 1, _name)),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      child: _createButton(
                          "Reestablecer", 2, 'Ayudame! Estoy en peligro!')),
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
      maxLength: 80,
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
        if (value.length < 80) {
          setState(() {
            _name = value;
          });
          funcion(1, value);
        } else {
          value = _name;
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('¡Número de caracteres máximo!')));
        }
      },
    );
  }

  Widget _createButton(String text, int op, String texto) {
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
      onPressed: () => funcion(op, texto),
    );
  }
}
