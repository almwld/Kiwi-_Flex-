import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class BanksWalletsScreen extends StatelessWidget {
  const BanksWalletsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const CustomAppBar(title: 'بنوك ومحافظ'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_balance, size: 80, color: AppTheme.goldColor.withOpacity(0.5)),
            const SizedBox(height: 16),
            Text('البنوك والمحافظ', style: TextStyle(fontFamily: 'Changa', fontSize: 24, color: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkText : AppTheme.lightText)),
          ],
        ),
      ),
    );
  }
}
