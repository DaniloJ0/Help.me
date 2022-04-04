import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:apphelpme/ui/home_page.dart';
import 'package:apphelpme/ui/menu_page.dart';
import 'package:apphelpme/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our app is in the home screen.
    expect(find.text('HELP'), findsOneWidget);
    expect(find.text('Usuario'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.settings));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('HELP'), findsNothing);
    expect(find.text('Usuario'), findsOneWidget);
  });
}
