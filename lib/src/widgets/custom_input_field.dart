import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    Key? key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    required this.formProperty,
    required this.formValues,
  }) : super(key: key);

  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;

  final String formProperty;
  final Map<String, dynamic> formValues;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // autofocus: true,
      initialValue: '',
      keyboardType: keyboardType,
      obscureText: obscureText,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          helperText: helperText,
          suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
          icon: icon == null ? null : Icon(icon)),
      onChanged: (value) {
        formValues[formProperty] = value;
      },
      validator: (value) {
        // sólo funciona si tenemos un form
        // if (value == null) return 'Este campo es requerido';
        return value!.length < 3 ? 'Mínimo 3 letras' : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
