import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:roqtrade/app/app.bottomsheets.dart';
import 'package:roqtrade/app/app.locator.dart';
import 'package:roqtrade/ui/common/app_strings.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group('showBottomSheet -', () {
      test(
        'When called, should show custom bottom sheet using notice variant',
        () {
          final bottomSheetService = getAndRegisterBottomSheetService();

          verify(
            bottomSheetService.showCustomSheet(
              variant: BottomSheetType.notice,
              title: ksHomeBottomSheetTitle,
              description: ksHomeBottomSheetDescription,
            ),
          );
        },
      );
    });
  });
}
