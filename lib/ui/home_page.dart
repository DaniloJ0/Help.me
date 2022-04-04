import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
          flex: 4,
          child:MaterialButton(
            color: Colors.red[400],
            shape: const CircleBorder(),
            onPressed: ()=> (){},
            child: const Padding(
              padding: EdgeInsets.all(80),
              child: Text(
                'HELP',
                style: TextStyle(
                    color: Colors.white, fontSize: 60, fontFamily: 'Suez One'),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(children: [
          const Text('Presione el botón para\n         pedir ayuda\n',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          const Text('Su ubicación actual es:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          const Text('Uninorte, Barranquilla', style: TextStyle(fontSize: 20)),
          ],)
      )],
      ),
    );
  }
}


// Widget FadedCircle(){
//   return RippleAnimation(
//   repeat: false,
//   color: Colors.blue,
//   minRadius: 100,
//   ripplesCount: 6,
//   child: Container()
// );
// }
