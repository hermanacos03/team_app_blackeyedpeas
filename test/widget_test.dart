import 'package:flutter_test/flutter_test.dart';
import 'package:team_app_blackeyedpeas/main.dart';

void main() {
  testWidgets('Counter increases when Increase button is tapped',
      (WidgetTester tester) async {

    // Build the app
    await tester.pumpWidget(MyApp());

    // Confirm counter starts at 0
    expect(find.text('0'), findsOneWidget);

    // Tap the Increase button
    await tester.tap(find.text('Increase'));
    await tester.pump();

    // Confirm it incremented
    expect(find.text('1'), findsOneWidget);
  });
}
