import 'package:flutter_test/flutter_test.dart';
import 'package:hiretop_mobile_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('JobServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
