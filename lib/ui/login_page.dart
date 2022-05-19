import 'dart:io';

import 'package:apphelpme/ui/home_page.dart';
import 'package:apphelpme/ui/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final auth = FirebaseAuth.instance;
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          backgroundColor: const Color(0xffff2d55),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Stack(
          children: <Widget>[
            //imagen de fondo
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/assets/image1.png'),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter)),
            ),
            //Layout blanco
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 190),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              //Login design
              child: Padding(
                padding: EdgeInsets.all(23),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: Container(
                        color: Color(0xfff5f5f5),
                        child: TextFormField(
                          // Usuario
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            setState(() {
                              _email = value.toString().trim();
                            });
                          },
                          style: TextStyle(
                              color: Colors.black, fontFamily: 'SFUIDisplay'),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Correo',
                              prefixIcon: Icon(Icons.person_outline),
                              labelStyle: TextStyle(fontSize: 15)),
                        ),
                      ),
                    ),
                    Container(
                      color: Color(0xfff5f5f5),
                      child: TextFormField(
                        //password
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Por favor, ingresa un contraseña";
                          }
                        },
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
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
                    //Sign In Buttom
                    Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: MaterialButton(
                        onPressed: () async {
                          try {
                            // print(_email + ' - ' + _password);
                            final user = await auth.signInWithEmailAndPassword(
                                email: _email, password: _password);
                            if (user != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Acceso exitoso.')));
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return HomePage();
                              }));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'No se encuentra registrado este correo')));
                            }
                          } catch (e) {
                            connection(context);
                          }
                        },
                        //Get.to(()=>HomePage()), //since this is only a UI app
                        child: Text(
                          'Ingresar',
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
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Center(
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "¿No tienes una cuenta?",
                                style: TextStyle(
                                  fontFamily: 'SFUIDisplay',
                                  color: Colors.black,
                                  fontSize: 15,
                                )),
                            TextSpan(
                              text: "  Registrate",
                              style: TextStyle(
                                  fontFamily: 'SFUIDisplay',
                                  color: Color(0xffff2d55),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(() => SignUpPage()),
                            )
                          ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )));
  }
}

//Validacion de la conexion
Future<void> connection(context) async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Por favor, verifique los campos de usuario y/o contraseña.')));
    }
  } on SocketException catch (_) {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Sin acceso a internet.')));
  }
}
