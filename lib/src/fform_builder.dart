import 'package:flutter/cupertino.dart';

import 'fform.dart';

/// FFormWidgetBuilder is a function that builds a form widget.
typedef FFormWidgetBuilder<T> = Widget Function(BuildContext context, T form);

/// FFormBuilder is a widget that builds a form and manages the state of the form.
/// It is used to create a form and manage the state of the form.
class FFormBuilder<T extends FForm> extends StatefulWidget {
  /// The form to be built and managed.
  final T form;

  /// The builder to build the form.
  final FFormWidgetBuilder<T> builder;

  /// Creates a FFormBuilder.
  const FFormBuilder({
    super.key,
    required this.form,
    required this.builder,
  });

  @override
  State<FFormBuilder<T>> createState() => FFormBuilderState<T>();
}

/// The state of the FFormBuilder.
class FFormBuilderState<T extends FForm> extends State<FFormBuilder<T>> {
  @override
  void initState() {
    /// Add a listener to the stream of the form.
    widget.form.addListener(_listenForm);
    super.initState();
  }

  @override
  void dispose() {
    /// Remove the listener to the stream of the form.
    widget.form.removeListener(_listenForm);
    super.dispose();
  }

  /// Listen to the form and update the state.
  void _listenForm() {
    setState(() {});
  }

  /// Build the form using the builder.
  @override
  Widget build(BuildContext context) => widget.builder(context, widget.form);
}
