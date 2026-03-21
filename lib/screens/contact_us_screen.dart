import '../../widgets/simple_app_bar.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const CustomAppBar(title: 'تواصل معنا'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'الاسم', filled: true, fillColor: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkCard : AppTheme.lightCard, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none))),
            const SizedBox(height: 16),
            TextField(decoration: InputDecoration(labelText: 'البريد الإلكتروني', filled: true, fillColor: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkCard : AppTheme.lightCard, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none))),
            const SizedBox(height: 16),
            TextField(maxLines: 4, decoration: InputDecoration(labelText: 'الرسالة', filled: true, fillColor: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkCard : AppTheme.lightCard, border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none))),
            const SizedBox(height: 24),
            CustomButton(text: 'إرسال', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
