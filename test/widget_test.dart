import 'package:flutter_test/flutter_test.dart';
import 'package:new_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('App loads splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const NeevMoneyApp());
    // Splash checks prefs asynchronously; avoid pumpAndSettle (progress
    // indicators / fonts can keep the tree unsettled).
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('Get started'), findsOneWidget);
    expect(find.text('I already have an account'), findsOneWidget);
  });
}
