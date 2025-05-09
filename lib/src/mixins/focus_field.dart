import 'package:fform/fform.dart';
import 'package:flutter/widgets.dart';

/// A mixin that adds a [FocusNode] to a form field.
///
/// This mixin provides a [FocusNode] named [focus], which can be used
/// to manage the keyboard focus of the field in the UI. It is intended
/// to be used with a class that extends [FFormField].
///
/// The [FocusNode] is created lazily and disposed of properly
/// when the field is disposed.
///
/// Type Parameters:
/// - [T] — The value type of the form field.
/// - [E] — The error type associated with the field validation.
mixin FocusField<T, E> on FFormField<T, E> {
  /// The [FocusNode] associated with this field.
  ///
  /// Used to manage focus programmatically and respond to focus changes.
  late final FocusNode focus = FocusNode();

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }
}
