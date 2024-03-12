part of 'fform.dart';

/// FFormField is a base class for all form fields.
/// It has a value and a validator.
/// It has a method to check if the field is valid.
/// It has a method to check if the field is invalid.
/// It has a method to get the exception of the field.

class FFormFieldResponse<T, E> {
  final T value;
  final E? exception;

  FFormFieldResponse(this.value, this.exception);
}

typedef FFormFieldListener<T, E> = void Function(
    FFormFieldResponse<T, E> value);

abstract class FFormField<T, E> {
  /// Value of the field.
  T _value;

  /// Function to call when the value of the field changes.
  List<FFormFieldListener<T, E>> listeners = [];

  /// add listener to the field.
  void addListener(FFormFieldListener<T, E> callback) {
    listeners.add(callback);
  }

  /// remove listener from the field.
  void removeListener(FFormFieldListener<T, E> callback) {
    listeners.remove(callback);
  }

  /// Function to call when the value of the field changes.
  _callListeners() {
    for (var listener in listeners) {
      listener(FFormFieldResponse(value, exception));
    }
  }

  /// Constructor of the class.
  FFormField(T value) : _value = value;

  /// get value of the field.
  T get value => _value;

  /// set value of the field.
  set value(T newValue) {
    if (_value != newValue) {
      _value = newValue;
      _callListeners();
    }
  }

  /// Validator of the field.
  E? validator(T value);

  /// Check if the field is valid.
  bool get isValid => exception == null;

  /// Check if the field is invalid.
  bool get isNotValid => !isValid;

  /// Get the exception of the field.
  E? get exception => validator(value);

  /// Check if the field is valid.
  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is FFormField<T, E> &&
        other.value == value &&
        other.isValid == isValid;
  }

  @override
  int get hashCode => Object.hashAll([value, isValid]);
}
