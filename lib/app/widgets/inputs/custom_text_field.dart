import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  const CustomTextField(
      {super.key, required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;
    return TextField(
      controller: controller,
      style: textTheme.bodySmall!
          .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: theme.primary, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: theme.primary, width: 1.5),
          ),
          labelText: hint,
          labelStyle: textTheme.bodyMedium!.copyWith(fontSize: 14)),
    );
  }
}
