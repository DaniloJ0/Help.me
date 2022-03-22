import 'package:flutter/material.dart';

void main() {
  runApp(const Message());
}

class Message extends StatelessWidget {
  const Message({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.red,
        fontFamily: 'Arial',
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 245, 10, 10),
          centerTitle: true,
          title: const Text('Personalizar Mensaje'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}