import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../../domain/models/human.dart';

class Contacts extends StatefulWidget {
  Contacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  int counter = 0;
  List<Human> entries = <Human>[Human('Cristian Duran','3025456458')];

  void onPressed() {
    setState(() {
      entries.add(Human(faker.person.name(),
          (faker.randomGenerator.decimal(min: 3000000000,scale: 115654945).floor()).toString()));
      counter = entries.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contactos de Emergencia'),
          backgroundColor: const Color.fromARGB(255, 245, 10, 10),
          centerTitle: true,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (context, index) {
            return _row(entries[index], index);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() => {onPressed()}),
          backgroundColor: const Color.fromARGB(255, 245, 10, 10),
          tooltip: 'Añadir Contacto',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _row(Human human, int index) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(
            color: Colors.red,
            alignment: Alignment.centerLeft,
            child: const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Deleting",
                style: TextStyle(color: Colors.white),
              ),
            )),
        child: _card(human),
        onDismissed: (direction) {
          // Remove the item from the data source.
          setState(() {
            entries.remove(human);
          });
        });
  }

  Widget _card(Human human) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10.0),
        leading: Icon(Icons.contacts),
        title: Text(human.name),
        subtitle: Text(human.email),
        isThreeLine: true,
      ),
    );
  }
}
