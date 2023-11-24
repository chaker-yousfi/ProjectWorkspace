import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final String name;

  const MyTextFormField({
    Key? key,
    required this.name,
    required String? Function(dynamic value) validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: name,
      ),
    );
  }
}
