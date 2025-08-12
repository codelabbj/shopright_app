import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final bool isMultiline;

  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.isMultiline = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[300]!),
      borderRadius: BorderRadius.circular(5),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelSmall),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          maxLines: isMultiline ? 3 : 1,
          keyboardType: keyboardType,
          style: Theme.of(context).textTheme.labelSmall,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            border: border,
            enabledBorder: border,
            focusedBorder: border,
            errorBorder: border,
            focusedErrorBorder: border,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
