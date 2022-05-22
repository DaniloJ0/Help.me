import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'dart:typed_data';
import '../../domain/models/human.dart';

class Contacts extends StatefulWidget {
  Contacts({Key? key}) : super(key: key);
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
List<Contact> _suggestions = <Contact>[];
  Set<Contact> _saved = <Contact>{};
  List<Contact>? contacts;
  @override
  void initState() {
    super.initState();
    getContact();
    _suggestions = <Contact>[];
    _saved = <Contact>{};
  }

  void getContact() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      print(contacts);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Contactos de Emergencia",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: _pushSaved,
              tooltip: 'Contactos Seleccionados',
            ),
          ],
        ),
        body: (contacts) == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: contacts!.length,
                itemBuilder: (BuildContext context, int index) {
                  Uint8List? image = contacts![index].photo;
                  String num = (contacts![index].phones.isNotEmpty)
                      ? (contacts![index].phones.first.number)
                      : "--";
                  final alreadySaved = _saved.contains(contacts![index]);
                  return ListTile(
                      leading: (contacts![index].photo == null)
                          ? const CircleAvatar(child: Icon(Icons.person))
                          : CircleAvatar(backgroundImage: MemoryImage(image!)),
                      title: Text(
                          "${contacts![index].name.first} ${contacts![index].name.last}"),
                      subtitle: Text(num),
                      trailing: Icon(
                        alreadySaved ? Icons.favorite : Icons.favorite_border,
                        color: alreadySaved ? Colors.red : null,
                        semanticLabel:
                            alreadySaved ? 'Quitar Selección' : 'Seleccionar',
                      ),
                      onTap: () {
                        if (contacts![index].phones.isNotEmpty) {
                          setState(() {
                            if (alreadySaved) {
                              _saved.remove(contacts![index]);
                            } else {
                              _saved.add(contacts![index]);
                            }
                          });
                        }
                      });
                },
              ));
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _saved.map(
            (contacts) {
              String num = contacts.phones.first.number;
              return ListTile(
                /* title: Text(
                  contacts.toString(),*/
                leading: (contacts.photo == null)
                    ? const CircleAvatar(child: Icon(Icons.person))
                    : const CircleAvatar(child: Icon(Icons.person)),
                title: Text("${contacts.name.first} ${contacts.name.last}"),
                subtitle: Text(num),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
                  context: context,
                  tiles: tiles,
                ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('Contactos Seleccionados'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}
