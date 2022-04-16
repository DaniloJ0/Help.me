import 'package:apphelpme/ui/home_page.dart';
import 'package:apphelpme/ui/menu_page.dart';
import 'package:apphelpme/ui/sign_up_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/image1.png'),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter)),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 190),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(23),
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
                Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: MaterialButton(
                    onPressed: () => Get.to(HomePage()), //since this is only a UI app
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
                // Padding(
                //   padding: EdgeInsets.only(top: 20),
                //   child: Center(
                //     child: Text(
                //       '¿Olvidaste tu contraseña?',
                //       style: TextStyle(
                //           fontFamily: 'SFUIDisplay',
                //           fontSize: 15,
                //           fontWeight: FontWeight.bold),
                //     ),
                //   ),
                // ),
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
                              fontWeight: FontWeight.w600
                            ),
                            recognizer: TapGestureRecognizer()..onTap = ()=>Get.to(SignUpPage()),
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
    );
  }
}
