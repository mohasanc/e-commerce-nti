import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.validator,
    required this.controller,
    this.obscureText,
    this.suffixIcon,
    this.keyboardType,
    this.maxLines = 1,
  });

  final String labelText, hintText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool? obscureText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            color: Color(0XFF4E0189),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 4),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hint: Text(hintText),
            hintStyle: TextStyle(color: Color(0xff9E9E9E)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
