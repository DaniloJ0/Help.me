import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/listItems.dart';
import 'help_page.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      customAppBar(),
      Container(
        height: 125.0,
        // color: Colors.red[200],
        child: headBar(),
      ),
      Expanded(
        flex: 4,
        child: ListMenu(),
      ),
      const Expanded(
          child: Center(
              child: Text(
        'Help.me',
        style: TextStyle(
            fontFamily: 'Abhaya Libre SemiBold',
            fontSize: 16,
            fontWeight: FontWeight.w600),
      )))
    ]);
  }
}
Widget ListMenu(){
    return ListView(
      children: [
        ListTile(
          leading: icons('contact'),
          title: textos('Nombre', 17.0, FontWeight.w500),
          subtitle: textos(
              'Sofia Vergara', 14.0, FontWeight.w400),
          onTap: () => () {},
        ),
        ListTile(
            leading: icons('herCoNtact'),
            title: textos('Telefono', 17.0, FontWeight.w500),
            subtitle: textos('30050649233', 14.0,
                FontWeight.w400),
            onTap: () => () {}),
      ],
    );
  }


Widget customAppBar() {
  return Row(
    children: [Expanded(flex: 1, child: appBar())],
  );
}

Widget appBar() {
  return Container(
      color: Colors.red,
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ));
}

Widget headBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Container(
              alignment: Alignment.center,
              width: 150.0,
              height: 150.0,
              child: const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('lib/assets/sofia.png')),
              decoration: const BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.circle,
              ))),
                    ),
   
    ],
  );
}
