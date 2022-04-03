import 'package:apphelpme/ui/tyc.dart';
import 'package:apphelpme/ui/userinfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Base project',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
          body: SafeArea(child: UserInfo()),
        ));
  }
}
