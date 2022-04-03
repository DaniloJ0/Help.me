import 'package:flutter/material.dart';

import '../widgets/appBar.dart';
import '../widgets/listItems.dart';

class TyCPAGE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Terminos y Condiciones",
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        width: width,
        child: Text(
          "\n" +
              "Qué se trata en estos términos" +
              "\n" +
              "Sabemos que es tentador saltarse estos Términos del Servicio, pero es importante determinar qué puedes esperar de nosotros al usar los servicios de Help.me y qué esperamos nosotros de ti."
                  "\n" +
              "Estos Términos del Servicio reflejan la forma de trabajar de Help.me como empresa, las leyes por las que nos regimos y determinados aspectos que siempre hemos creído que son ciertos. Por ello, estos Términos del Servicio ayudan a definir la relación que tiene Help.me contigo cuando interactúas con nuestros servicios. Por ejemplo, estos términos incluyen las siguientes secciones:"
                  "\n" +
              "Qué puedes esperar de nosotros, donde se describe cómo proporcionamos y desarrollamos nuestros servicios."
                  "\n" +
              "Lo que esperamos de ti, donde se establecen ciertas reglas para utilizar nuestros servicios."
                  "\n" +
              "Contenido en los servicios de Google, donde se describen los derechos de propiedad intelectual relacionados con el contenido que aparece en nuestros servicios, ya sea propiedad tuya, de Google o de terceros."
                  "\n" +
              "En caso de problemas o discrepancias, donde se describen otros derechos legales que tienes y las consecuencias de infringir estos términos.",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
