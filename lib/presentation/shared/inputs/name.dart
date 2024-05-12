import 'package:formz/formz.dart';

// Define input validation errors
enum NameError { empty, format, length}

// Extend FormzInput and provide the input type and error type.
class Name extends FormzInput<String, NameError> {

  // ignore: non_constant_identifier_names
  static final RegExp NameRegExp = RegExp(
    r'^[a-zA-Z]{4,}(?: [a-zA-Z]+)*$',
  );

  // Call super.pure to represent an unmodified form input.
  const Name.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Name.dirty( String value ) : super.dirty(value);



  String? get errorMessage {
    if ( isValid || isPure ) return null;

    if ( displayError == NameError.empty ) return 'El campo es requerido';
    if ( displayError == NameError.length ) return 'El nombre debe tener al menos 4 caracteres';
    if ( displayError == NameError.format ) return 'Error en el formato';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  NameError? validator(String value) {
    
    if ( value.isEmpty || value.trim().isEmpty ) return NameError.empty;
    if ( !NameRegExp.hasMatch(value) ) return NameError.length;

    return null;
  }
}