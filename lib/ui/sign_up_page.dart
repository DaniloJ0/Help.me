import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  String _user = '';
  String _email = '';
  String _password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Registro'),
          backgroundColor: const Color(0xffff2d55),
          centerTitle: true,
        ),
        body: Container(
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
                      //Usuario
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        _user = value.toString().trim();
                      },
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
                    //Correo
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      _email = value.toString().trim();
                    },
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
                  child: Container(
                    color: Color(0xfff5f5f5),
                    child: TextFormField(
                      //Password
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Por favor, ingresa un contraseña";
                        }
                      },
                      onChanged: (value) {
                        _password = value;
                      },
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
                    onPressed: () async {
                      try {
                        await _auth.createUserWithEmailAndPassword(
                            email: _email, password: _password);
                        print(_email + ' - ' + _password);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Sucessfully Register.You Can Login Now'),
                            duration: Duration(seconds: 5),
                          ),
                        );
                        Navigator.of(context).pop();
                      } on FirebaseAuthException catch (e) {
                        showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                                title: Text(' Ops! Registration Failed'),
                                content: Text('${e.message}')));
                      }
                    }, //since this is only a UI app
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
        ));
  }
}
