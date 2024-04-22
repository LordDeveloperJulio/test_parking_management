import 'package:flutter_test/flutter_test.dart';
import 'package:test_parking_management/app/modules/detail_register/presentation/detail_keys/detail_keys.dart';
import 'package:test_parking_management/app/modules/detail_register/presentation/detail_register_page.dart';
import 'package:test_parking_management/app/modules/home/presentation/home_keys/home_keys.dart';
import 'package:test_parking_management/app/modules/home/presentation/home_page.dart';
import 'package:test_parking_management/main.dart' as app;
import 'package:integration_test/integration_test.dart';

import 'extension/widget_tester_ext.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
      'Open the home page and click on an item in the list, navigate '
      'to the details screen and click on "release vacancy"',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpUntilFound(tester, find.byType(HomePage));
    await tester.tap(find.byKey(HomeKeys.cardListKey));
    await tester.pumpAndSettle();
    expect(find.byType(DetailRegisterPage), findsOneWidget);

    await tester.tap(find.byKey(DetailKeys.releaseVacancyButtonKey));
    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsOneWidget);
  });
}
