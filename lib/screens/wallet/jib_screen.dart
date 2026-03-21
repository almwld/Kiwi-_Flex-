import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class JibScreen extends StatelessWidget {
  const JibScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: CustomAppBar(title: 'فلكسي'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.flash_on, size: 80, color: AppTheme.goldColor.withOpacity(0.5)),
            const SizedBox(height: 16),
            Text('خدمة فلكسي', style: TextStyle(fontFamily: 'Changa', fontSize: 24, color: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkText : AppTheme.lightText)),
          ],
        ),
      ),
    );
  }
}
