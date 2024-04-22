import 'package:flutter_test/flutter_test.dart';
import 'package:test_parking_management/app/modules/add_register/domain/domain.dart';
import 'package:test_parking_management/app/modules/add_register/presentation/add_register_keys/add_register_keys.dart';
import 'package:test_parking_management/app/modules/add_register/presentation/add_vacancy_page.dart';
import 'package:test_parking_management/app/modules/home/presentation/home_keys/home_keys.dart';
import 'package:test_parking_management/app/modules/home/presentation/home_page.dart';
import 'package:test_parking_management/main.dart' as app;
import 'package:integration_test/integration_test.dart';

import 'extension/widget_tester_ext.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  const String driverName = 'José Silva';
  const String plate = 'NAX2R55';

  testWidgets(
      'Open the home page and click on an item in the list, navigate '
      'to the details screen and click on "release vacancy"',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpUntilFound(tester, find.byType(HomePage));
    await tester.tap(find.byKey(HomeKeys.floatButtonKey));
    await tester.pumpAndSettle();
    expect(find.byType(AddRegisterPage), findsOneWidget);

    await tester.pumpAndSettle();

    await tester.enterText(
      find.byKey(AddRegisterKeys.driverNameInputKey),
      driverName,
    );
    await tester.enterText(
      find.byKey(AddRegisterKeys.plateInputKey),
      plate,
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byKey(AddRegisterKeys.vacancySelectKey));
    await tester.pumpAndSettle();

    await tester.tap(find.text('5'));
    expect(find.text('5'), findsOneWidget);

    await tester.tap(find.byKey(AddRegisterKeys.registerButtonKey));
    await tester.pumpAndSettle();
  });
}
