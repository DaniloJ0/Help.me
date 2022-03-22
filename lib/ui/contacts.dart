import 'package:flutter/material.dart';

void main() {
  runApp(Contacts());
}

class Contacts extends StatelessWidget {
  Contacts({Key? key}) : super(key: key);
  final ScrollController _scrollController = ScrollController();

  final List<Map<String,String>>data =[
    {
      "name": "Zahir Ballard",
      "phone": "1-531-990-0526",
      "email": "ornare.libero@hotmail.com",
      "region": "Valle d'Aosta",
      "country": "India"
    },
    {
      "name": "Yeo Merrill",
      "phone": "1-332-774-4832",
      "email": "lectus.pede@hotmail.ca",
      "region": "Warwickshire",
      "country": "United States"
    },
    {
      "name": "Jeanette Collier",
      "phone": "(322) 372-8789",
      "email": "lacus.ut@protonmail.net",
      "region": "Samsun",
      "country": "Germany"
    },
    {
      "name": "Abraham Carrillo",
      "phone": "(877) 399-1647",
      "email": "urna.nec@icloud.ca",
      "region": "Ivanovo Oblast",
      "country": "China"
    },
    {
      "name": "Kiona Lowery",
      "phone": "1-275-555-4573",
      "email": "magna.duis@icloud.net",
      "region": "Ankara",
      "country": "Pakistan"
    },
    {
      "name": "Thaddeus Curry",
      "phone": "(944) 256-2684",
      "email": "massa.mauris.vestibulum@outlook.org",
      "region": "Henegouwen",
      "country": "Colombia"
    },
    {
      "name": "Lucian Perry",
      "phone": "1-263-978-3556",
      "email": "vitae@aol.com",
      "region": "Tasmania",
      "country": "Brazil"
    },
    {
      "name": "Yuri Gaines",
      "phone": "1-220-445-1914",
      "email": "vitae.diam.proin@outlook.edu",
      "region": "Maine",
      "country": "Peru"
    },
    {
      "name": "Ronan Farmer",
      "phone": "(477) 560-7527",
      "email": "ac@google.net",
      "region": "Galicia",
      "country": "Canada"
    },
    {
      "name": "Tad Potts",
      "phone": "1-881-467-8342",
      "email": "sem@hotmail.edu",
      "region": "Maranhão",
      "country": "Mexico"
    }];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contactos',
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
          title: const Text('Contacts'),
          elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)),
                hintText: 'Search by name or number',
                prefixIcon: const Icon(Icons.search)
          ),
          ),),),),
        
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}