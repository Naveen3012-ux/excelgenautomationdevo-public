import 'package:excelgenautomationdevo/screens/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('login button opens dispatcher dashboard', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
      ),
    );

    expect(find.text('Login'), findsOneWidget);

    await tester.ensureVisible(find.text('Login'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    expect(find.text('Welcome back, Dispatch User!'), findsOneWidget);
    expect(find.text('Dashboard'), findsWidgets);
  });
}
