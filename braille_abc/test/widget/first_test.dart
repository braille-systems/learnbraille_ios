//import 'package:flutter/material.dart';
import 'package:braille_abc/screens/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('My first test', (WidgetTester tester) async {
    await tester.pumpWidget(HomeScreen());

/*
    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
*/
  });
}
