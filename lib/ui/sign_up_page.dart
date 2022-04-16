import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registro'),
          backgroundColor: const Color(0xffff2d55),
          centerTitle: true,
        ),
      body:
        Container(
          width: MediaQuery.of(context).size.width,
          // margin: EdgeInsets.only(top: 50),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(30, 110, 30, 20),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Container(
                    color: Color(0xfff5f5f5),
                    child: TextFormField(
                      style: TextStyle(
                          color: Colors.black, fontFamily: 'SFUIDisplay'),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Usuario',
                          prefixIcon: Icon(Icons.person_outline),
                          labelStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                ),
               Container(
                    color: Color(0xfff5f5f5),
                    child: TextFormField(
                      style: TextStyle(
                          color: Colors.black, fontFamily: 'SFUIDisplay'),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Correo',
                          prefixIcon: Icon(Icons.mail_outline),
                          labelStyle: TextStyle(fontSize: 15)),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child:Container(
                  color: Color(0xfff5f5f5),
                  child: TextFormField(
                    obscureText: true,
                    style: TextStyle(
                        color: Colors.black, fontFamily: 'SFUIDisplay'),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Contraseña',
                        prefixIcon: Icon(Icons.lock_outline),
                        labelStyle: TextStyle(fontSize: 15)),
                  ),
                ),
              ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: MaterialButton(
                    onPressed: () {}, //since this is only a UI app
                    child: Text(
                      'Registrar',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'SFUIDisplay',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Color(0xffff2d55),
                    elevation: 0,
                    minWidth: 400,
                    height: 50,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
          ),
        )
      );
  }
}
