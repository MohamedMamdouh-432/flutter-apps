import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextEditingController controller;
  String title;
  Icon icon;
  TextFormFieldWidget({
    Key? key,
    required this.controller,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        prefixIcon: icon,
      ),
      keyboardType: TextInputType.text,
      validator: (String? value) {
        if (value!.isEmpty) {
          return '{$title} must not be empty';
        }
        return null;
      },
    );
  }
}
