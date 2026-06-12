import 'package:excelgenautomationdevo/screens/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('login button opens role selection screen', (tester) async {
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

    expect(find.text('Excel Autogen'), findsOneWidget);
    expect(find.text('Dispatch User'), findsOneWidget);
    expect(find.text('Billing User'), findsOneWidget);
    expect(find.text('Management'), findsOneWidget);
    expect(find.text('Admin'), findsOneWidget);
  });
}
