import 'package:flutter/material.dart';

/// Widget personalizado de botón relleno.
class CustomFilledButton extends StatelessWidget {
  /// La función de devolución de llamada que se ejecutará cuando se presione el botón.
  final void Function()? onPressed;
  /// El texto que se mostrará en el botón.
  final String text;
  /// El color de fondo del botón.
  final Color? buttonColor;

  /// Construye un [CustomFilledButton] con los parámetros proporcionados.
  const CustomFilledButton({
    super.key, 
    this.onPressed, 
    required this.text, 
    this.buttonColor
  });

  @override
  Widget build(BuildContext context) {

    const radius = Radius.circular(10);

    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: buttonColor,
        shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: radius,
          bottomRight: radius,
          topLeft: radius,
        )
      )),
        
      onPressed: onPressed, 
      child: Text(text),
    );
  }
}