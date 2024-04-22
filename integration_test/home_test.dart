import 'package:flutter_test/flutter_test.dart';
import 'package:test_parking_management/app/modules/add_register/presentation/add_vacancy_page.dart';
import 'package:test_parking_management/app/modules/detail_register/presentation/detail_register_page.dart';
import 'package:test_parking_management/app/modules/home/presentation/home_keys/home_keys.dart';
import 'package:test_parking_management/app/modules/home/presentation/home_page.dart';
import 'package:test_parking_management/main.dart' as app;
import 'package:integration_test/integration_test.dart';

import 'extension/widget_tester_ext.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Open the home page and click on an item in the list', (WidgetTester tester) async {
    app.main();
    await tester.pumpUntilFound(tester, find.byType(HomePage));
    await tester.tap(find.byKey(HomeKeys.cardListKey));
    await tester.pumpAndSettle();
    expect(find.byType(DetailRegisterPage), findsOneWidget);
  });

  testWidgets('Open menu and click Departures/Day', (WidgetTester tester) async {
    app.main();
    await tester.pumpUntilFound(tester, find.byType(HomePage));
    await tester.tap(find.byKey(HomeKeys.popUpMenuKey));
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(HomeKeys.popUpMenuDeparturesDay));
    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);
  });

  testWidgets('Open the home page and click on the add button and navigate to '
      'the registration screen', (WidgetTester tester) async {
    app.main();
    await tester.pumpUntilFound(tester, find.byType(HomePage));
    await tester.tap(find.byKey(HomeKeys.floatButtonKey));
    await tester.pumpAndSettle();
    expect(find.byType(AddRegisterPage), findsOneWidget);
  });
}
