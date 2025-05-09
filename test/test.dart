import 'package:flutter_test/flutter_test.dart';

import 'src/unit_tests/async_field_test.dart' as async_test;
import 'src/unit_tests/cached_mixin_test.dart' as cached_mixin_test;
import 'src/unit_tests/fform_status_test.dart' as fform_status;
import 'src/unit_tests/field_exception_test.dart' as exception_test;
import 'src/unit_tests/field_test.dart' as field_test;
import 'src/unit_tests/form_test.dart' as form_test;
import 'src/unit_tests/observer_test.dart' as observer_test;
import 'src/widget_tests/builder_test.dart' as builder_test;
import 'src/widget_tests/focus_field_test.dart' as focus_field_test;
import 'src/widget_tests/provider_test.dart' as provider_test;


void main() {
  group('Widget test', () {
    provider_test.main();
    builder_test.main();
    focus_field_test.main();
  });
  group('Unit Test', () {
    field_test.main();
    form_test.main();
    fform_status.main();
    cached_mixin_test.main();
    exception_test.main();
    observer_test.main();
    async_test.main();
  });
}
