import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    this.onTap,
    required this.text,
  });
  String text;
  Function()? onTap;
  // double height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
