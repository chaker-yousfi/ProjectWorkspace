import 'package:flutter/material.dart';

class PasswordTextFormField extends StatelessWidget {
  final bool obserText;
  final String Function(String?)? validator;
  final String name;
  final void Function()? onTap;
  final String Function(String?)? onChanged;


  PasswordTextFormField({
    required this.obserText,
    this.validator,
    required this.name,
    this.onTap,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obserText,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        hintText: name,
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(
            obserText ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
        ),
        hintStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
