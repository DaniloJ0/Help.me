import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ui/login_page.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  } catch (e) {
    print('Error');
  }
  runApp(MyApp());
}

bool _status = false;

late SharedPreferences prefs;

_initMsg() async {
  prefs = await SharedPreferences.getInstance();
  _status = prefs.getBool('status') ?? false;
}

@override
void initState() {
  _initMsg();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login Page',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: SignInPage());
  }
}
