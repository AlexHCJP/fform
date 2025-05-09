import 'package:fform/fform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class MockFocusField extends FFormField<String, String>
    with FocusField<String, String> {
  MockFocusField(super.value);

  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return null;
    }
    return 'Field is Empty';
  }
}

void main() {
  group('Focus Node', () {
    testWidgets('Autofocus shows keyboard', (tester) async {
      final field = MockFocusField('');
      addTearDown(field.dispose);

      expect(tester.testTextInput.isVisible, isFalse);

      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: Center(
              child: TextField(
                focusNode: field.focus,
              ),
            ),
          ),
        ),
      );

      expect(tester.testTextInput.isVisible, isFalse);

      FocusScope.of(tester.element(find.byType(TextField)))
          .requestFocus(field.focus);
      await tester.pump();

      expect(tester.testTextInput.isVisible, isTrue);
    });
  });
}
