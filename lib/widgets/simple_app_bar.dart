import 'package:flutter/material.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final double height;

  const SimpleAppBar({super.key, this.title, this.actions, this.height = 56.0});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? Text(title!) : null,
      actions: actions,
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF1A1A2E)
          : const Color(0xFFFFFFFF),
      elevation: 0,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
