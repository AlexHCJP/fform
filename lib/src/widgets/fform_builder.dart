import 'package:fform/fform.dart';
import 'package:flutter/widgets.dart';

/// {@template fform_widget_builder}
/// A function that builds a form widget.
///
/// Takes a [BuildContext] and an instance of [FForm], and returns a [Widget].
///
/// ### Example
/// ```dart
/// Widget myFormBuilder(BuildContext context, MyForm form) {
///   return Column(
///     children: [
///       // Build your form fields here
///     ],
///   );
/// }
/// ```
/// {@endtemplate}
typedef FFormWidgetBuilder<T extends FForm> = Widget Function(
  BuildContext context,
  T form,
  Widget? child,
);

/// {@template fform_builder_class}
/// A widget that builds and manages the state of a form.
///
/// [FFormBuilder] is used to create a form and handle its state management.
/// It listens to the form's state changes and rebuilds its descendants accordingly.
/// {@endtemplate}
class FFormBuilder<T extends FForm> extends StatelessWidget {
  /// {@macro fform_builder_class}
  ///
  /// ### Example
  /// ```dart
  /// final form = MyForm();
  ///
  /// FFormBuilder<MyForm>(
  ///   form: form,
  ///   builder: (context, form) {
  ///     return Column(
  ///       children: [
  ///         // Build form fields using form
  ///       ],
  ///     );
  ///   },
  /// );
  /// ```
  const FFormBuilder({
    required this.form,
    required this.builder,
    this.child,
    super.key,
  });

  /// {@template form_property}
  /// The form instance to be built and managed.
  ///
  /// ### Example
  /// ```dart
  /// final form = MyForm();
  /// FFormBuilder<MyForm>(
  ///   form: form,
  ///   builder: myFormBuilder,
  /// );
  /// ```
  /// {@endtemplate}
  final T form;

  /// {@template builder_property}
  /// The builder function that constructs the form's widget tree.
  ///
  /// Receives the [BuildContext] and the form instance, and should return a [Widget].
  ///
  /// ### Example
  /// ```dart
  /// FFormBuilder<MyForm>(
  ///   form: form,
  ///   builder: (context, form) {
  ///     return MyFormWidget(form: form);
  ///   },
  /// );
  /// ```
  /// {@endtemplate}
  final FFormWidgetBuilder<T> builder;

  /// {@template child_property}
  /// An optional constant child widget that does not depend on the form state.
  ///
  /// This widget is passed to the [builder] function and will not be rebuilt when the form notifies listeners.
  ///
  /// ### Example
  /// ```dart
  /// FFormBuilder<MyForm>(
  ///   form: form,
  ///   child: const Text('Static footer'),
  ///   builder: (context, form, child) {
  ///     return Column(
  ///       children: [
  ///         TextField(
  ///           onChanged: form.update,
  ///         ),
  ///         if (child != null) child,
  ///       ],
  ///     );
  ///   },
  /// );
  /// ```
  /// {@endtemplate}
  final Widget? child;

  /// {@template build_method}
  /// Builds the widget tree by listening to the form's state changes and providing
  /// the form to its descendants.
  ///
  /// ### Example
  /// ```dart
  /// @override
  /// Widget build(BuildContext context) {
  ///   return FFormBuilder<MyForm>(
  ///     form: form,
  ///     builder: (context, form) {
  ///       // Build your form UI here
  ///     },
  ///   );
  /// }
  /// ```
  /// {@endtemplate}
  @override
  Widget build(BuildContext context) => FFormProvider<T>(
        form: form,
        child: ListenableBuilder(
          listenable: form,
          builder: (context, child) => builder(
            context,
            form,
            child,
          ),
          child: child,
        ),
      );
}
