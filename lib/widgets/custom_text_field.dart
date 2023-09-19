import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  bool obsecureText;
  CustomTextField({this.hintText, this.onChanged, this.obsecureText = false,this.inputType});
  String? hintText;
  TextInputType? inputType;

  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: false,
      keyboardType: inputType,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(16),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
