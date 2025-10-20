import 'package:flutter_test/flutter_test.dart';
import 'package:roqtrade/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('MyDasboardViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
