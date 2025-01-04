import 'dart:async';

import 'package:fform/fform.dart';

enum EmailError {
  empty,
  not,
  email;

  @override
  String toString() {
    switch (this) {
      case empty:
        return 'emailEmpty';
      case not:
        return 'invalidFormatEmail';
      default:
        return 'invalidFormatEmail';
    }
  }
}

class EmailField extends FFormField<String, EmailError> with CacheField<String, EmailError> {
  EmailField({required String value}) : super(value);

  @override
  FutureOr<EmailError?> validator(value) {
    if (value.isEmpty) return EmailError.empty;
    if (value == 'alexganbert@gmail.com') return Future.value(EmailError.email);
    return null;
  }

}
