import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String Function(String?)? validator;
  final String Function(String?)? onChanged;
  final String name;

  const MyTextFormField({
    required this.name,
    this.validator,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
          hintText: name,
          hintStyle: const TextStyle(color: Colors.black)),
    );
  }
}
