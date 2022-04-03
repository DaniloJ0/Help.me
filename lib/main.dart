import 'package:apphelpme/ui/home_page.dart';
import 'package:apphelpme/ui/menu_page.dart';
import 'package:flutter/material.dart';
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
        title: 'Menu Page',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
          appBar: AppBar(
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
          body: SafeArea(child: HomePage()),
        ));
  }
}
