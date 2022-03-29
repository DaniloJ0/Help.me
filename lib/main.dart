import 'package:flutter/material.dart';
import 'package:apphelpme/ui/contacts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List on Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: SimpleList(),
      //home: ListBuilder()
      //home: DynamicList(),
      home: Contacts(),
    );
  }
}
