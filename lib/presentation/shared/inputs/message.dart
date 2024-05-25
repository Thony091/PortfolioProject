import 'package:formz/formz.dart';

// Define input validation errors
enum MessageError { empty, format }

// Extend FormzInput and provide the input type and error type.
class Message extends FormzInput<String, MessageError> {

  static final RegExp messageRegExp = RegExp(
    r'^.{1,250}$',
  );

  // Call super.pure to represent an unmodified form input.
  const Message.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Message.dirty( String value ) : super.dirty(value);



  String? get errorMessage {
    if ( isValid || isPure ) return null;

    if ( displayError == MessageError.empty ) return 'El campo es requerido';
    if ( displayError == MessageError.format ) return 'El mensaje no puede superar los 350 caracteres';

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  MessageError? validator(String value) {
    
    if ( value.isEmpty || value.trim().isEmpty ) return MessageError.empty;
    if ( !messageRegExp.hasMatch(value) ) return MessageError.format;

    return null;
  }
}