import 'dart:async';
import 'dart:io';
import 'package:vibration/vibration.dart';
import 'package:apphelpme/permission/init_permission.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:telephony/telephony.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';

import '../widgets/circle_painter.dart';
import '../widgets/curve_wave.dart';
import 'menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    this.size = 90.0,
    this.color = Colors.red,
    required this.child,
    required this.onPressed,
  });
  final double size;
  final Color color;
  final Widget child;
  final VoidCallback onPressed;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final Telephony telephony = Telephony.instance;
  late AnimationController _controller;
  var latitude = 'latitud..'.obs;
  var longitude = 'longitud..'.obs;
  var _address = 'Sin internet';
  late StreamSubscription<Position> streamSubscription;

  @override
  void initState() {
    super.initState();
    RunPermission();
    getLocation();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changeLocation(address) {
    setState(() {
      _address = address;
    });
  }

  Widget _button() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.size),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: <Color>[widget.color, Colors.red],
            ),
          ),
          child: ScaleTransition(
            scale: Tween(begin: 0.95, end: 1.0).animate(
              CurvedAnimation(
                parent: _controller,
                curve: const CurveWave(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffff2d55),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                Get.to(() => MenuPage());
              },
            )
          ],
          title: const Text('Help.me'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 4,
                  child: Stack(
                    children: [Design(), buttonBig()],
                  )),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      const Text(
                          'Presione el botón para\n         pedir ayuda\n',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700)),
                    const Text('Su ubicación actual es:\n',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600)),
                      Text(_address, style: const TextStyle(fontSize: 20), textAlign: TextAlign.center),
                    ],
                  ))
            ],
          ),
        ));
  }

  Widget Design() {
    return Visibility(
      child: Center(
        child: CustomPaint(
          painter: CirclePainter(
            _controller,
            color: widget.color,
          ),
          child: _button(),
        ),
      ),
      visible: true,
    );
  }

  Widget buttonBig() {
    return Center(
      child: MaterialButton(
        color: Color.fromARGB(255, 232, 38, 74),
        shape: const CircleBorder(),
        onPressed: () => _sendSMS(),
        child: const Padding(
          padding: EdgeInsets.all(70),
          child: Text(
            'HELP',
            style: TextStyle(
                color: Colors.white, fontSize: 60, fontFamily: 'Suez One'),
          ),
        ),
      ),
    );
  }

  Future<void> connection(context) async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('')));
      }
    } on SocketException catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sin acceso a internet.')));
    }
  }

  _sendSMS() async {
    var status = await Permission.location.status;
    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Sin permisos de GPS, por favor activelo.'),
          duration: Duration(seconds: 1)));
      await openAppSettings();
    } else {
      //Aqui va el mensaje sacado de la base de datos
      Vibration.vibrate(duration: 1000);
      String msg_help =
          '¡Ayuda! me encuentro en peligro, te comparto mi ubicación';
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      String lat_lng =
          position.latitude.toString() + ',' + position.longitude.toString();
      String msg =
          '$msg_help https://www.google.com/maps/search/?api=1&query=$lat_lng';
      print(msg);
        List<String> listNumeros = ['+573146347090'];
        // send message
        bool val = true;
        for (var i = 0; i < listNumeros.length; i++) {
          telephony
              .sendSms(to: listNumeros[i], message: msg, isMultipart: true)
              .catchError((err) {
            val = false;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content:
                      Text('¡Opp! Ocurrió un error, puede que no tengas saldo')),
            );
          });
        }
        if(val) return ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Mensajes enviados a tus contactos')));
    }
  }

  getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    streamSubscription =
        Geolocator.getPositionStream().listen((Position position) {
      latitude.value = 'Latitude : ${position.latitude}';
      longitude.value = 'Longitude : ${position.longitude}';
      getAddressFromLatLang(position);
    });
  }

  Future<void> getAddressFromLatLang(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place = placemark[0];
    changeLocation(
        '${place.street} \n${place.locality}, ${place.country}');
    print(_address);
  }
}
