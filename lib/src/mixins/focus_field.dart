import 'package:fform/fform.dart';
import 'package:flutter/widgets.dart';

mixin FocusField<T, E> on FFormField<T, E> {
  late final FocusNode focus = FocusNode();

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }
}