import 'package:flutter/material.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List<String> contactsNums = [];
  List<String> contactsNames = [];

  late SharedPreferences prefs;

  _initializeContacts() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      contactsNums = prefs.getStringList('nums') ?? [];
      contactsNames = prefs.getStringList('names') ?? [];
    });
  }

  @override
  void initState() {
    _initializeContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Contactos de Emergencia"),
      ),
      body: contactsNames.length > 0
          ? ListView.builder(
              itemCount: contactsNames.length,
              itemBuilder: (BuildContext ctx, int i) {
                return Card(
                  margin: EdgeInsets.all(5),
                  child: ListTile(
                    leading: Icon(
                      Icons.account_circle,
                      size: 35,
                    ),
                    title: Text(contactsNames[i]),
                    subtitle: Text(contactsNums[i]),
                    trailing: GestureDetector(
                      child: Icon(Icons.delete),
                      onTap: () async {
                        setState(() {
                          contactsNames.removeAt(i);
                          contactsNums.removeAt(i);
                        });
                        await prefs.setStringList('nums', contactsNums);
                        await prefs.setStringList('names', contactsNames);
                      },
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text('Aún no has seleccionado contactos'),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final PhoneContact contact =
              await FlutterContactPicker.pickPhoneContact();
          setState(() {
            contactsNames.add(contact.fullName.toString());
            contactsNums.add(contact.phoneNumber!.number.toString());
          });
          await prefs.setStringList('nums', contactsNums);
          await prefs.setStringList('names', contactsNames);
        },
      ),
    );
  }
}
