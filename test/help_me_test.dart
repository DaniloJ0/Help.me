import 'package:apphelpme/ui/app_info_page.dart';
import 'package:apphelpme/ui/contactenos_page.dart';
import 'package:apphelpme/ui/help_center_page.dart';
import 'package:apphelpme/ui/help_page.dart';
import 'package:apphelpme/ui/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
testWidgets('Menu_setting', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
      body: MenuPage(),
    )));
    await tester.pump();
    expect(find.text('Usuario'), findsOneWidget);
    expect(find.text('Contactos'), findsOneWidget);
    expect(find.text('Personalizar mensaje de alerta'), findsOneWidget);
    expect(find.text('Términos y condiciones'), findsOneWidget);
    expect(find.text('Ayuda'), findsOneWidget);
    expect(find.text('Help.me'), findsOneWidget);
  });

  testWidgets('Ayuda widgets', (WidgetTester tester) async {
    await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
      body: HelpPage(),
    )));
    await tester.pump();
    expect(find.text('Centro de ayuda'), findsOneWidget);
    expect(find.text('Contactenos'), findsOneWidget);
    expect(find.text('App info'), findsOneWidget);
  });


  testWidgets('Centro de ayuda widgets', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
      body: HelpCenterPage(),
    )));
    await tester.pump();
    expect(find.text('155'), findsOneWidget);
    expect(find.text('165'), findsOneWidget);
    expect(find.text('112'), findsOneWidget);
    expect(find.text('144'), findsOneWidget);
    expect(find.text('132'), findsOneWidget);
    expect(find.text('119'), findsOneWidget);
    expect(find.text('125'), findsOneWidget);
  });

  testWidgets('Contactenos widgets', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
      body: ContatenosPage(),
    )));
    await tester.pump();
    expect(find.text('Correo'), findsOneWidget);
    expect(find.text('Pagina Web'), findsOneWidget);
    expect(find.text('Instagram'), findsOneWidget);
    expect(find.text('Twitter'), findsOneWidget);

  });

  testWidgets('App info widgets', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
      body: AppInfoPage(),
    )));
    await tester.pump();
    expect(find.text('Nombre de la app'), findsOneWidget);
    expect(find.text('Desarrollado'), findsOneWidget);
    expect(find.text('Fecha'), findsOneWidget);
    expect(find.text('Plataformas'), findsOneWidget);
    expect(find.text('Origen'), findsOneWidget);
    expect(find.text('Versión'), findsOneWidget);

  });

}


