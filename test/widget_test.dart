// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:catapp/main.dart';

void main() {
  testWidgets('App should start with home screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the app title is displayed.
    expect(find.text('🐱 Cat Gallery'), findsOneWidget);

    // Verify that the breeds button is present.
    expect(find.text('Breeds'), findsOneWidget);

    // Verify that the settings button is present.
    expect(find.byIcon(Icons.settings), findsOneWidget);

    // Verify that the refresh button is present.
    expect(find.byIcon(Icons.refresh), findsOneWidget);
  });
}
