import 'package:apphelpme/ui/contacts.dart';
import 'package:flutter/material.dart';
import 'package:apphelpme/ui/help_page.dart';
import 'package:apphelpme/ui/menu_page.dart';
import 'package:get/get.dart';
void main() {
  runApp(MyApp());
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
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: SafeArea(child: Contacts()),
        ));
  }
}
//Danilo
