import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: CustomAppBar(title: 'المساعدة والدعم'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.help_outline, color: AppTheme.goldColor),
              title: Text('الأسئلة الشائعة', style: TextStyle(fontFamily: 'Changa', color: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkText : AppTheme.lightText)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.pushNamed(context, '/faq'),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.chat_bubble_outline, color: AppTheme.goldColor),
              title: Text('تواصل معنا', style: TextStyle(fontFamily: 'Changa', color: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkText : AppTheme.lightText)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.pushNamed(context, '/contact_us'),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.support_agent, color: AppTheme.goldColor),
              title: Text('الدعم الفني', style: TextStyle(fontFamily: 'Changa', color: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkText : AppTheme.lightText)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () => Navigator.pushNamed(context, '/live_support'),
            ),
          ),
        ],
      ),
    );
  }
}
