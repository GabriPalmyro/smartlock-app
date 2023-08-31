import 'package:flutter/material.dart';

class CustomTextFieldPassword extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final FocusNode? focusNode;

  const CustomTextFieldPassword(
      {super.key,
      required this.hint,
      required this.controller,
      this.focusNode});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextFieldPassword> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;
    return TextField(
      controller: widget.controller,
      style: textTheme.bodySmall!
          .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: theme.primary, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: theme.primary, width: 1.5),
        ),
        labelText: widget.hint,
        labelStyle: textTheme.bodyMedium!.copyWith(fontSize: 14),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: theme.primary,
          ),
        ),
      ),

      obscureText: !_isPasswordVisible, // Toggle the obscureText property
    );
  }
}
