import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const PasswordTextField({super.key, this.controller, this.validator});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: 'كلمة المرور',
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: () => setState(() => _obscureText = !_obscureText),
        ),
        filled: true,
        fillColor: isDark ? AppTheme.darkCard : AppTheme.lightCard,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
    );
  }
}
