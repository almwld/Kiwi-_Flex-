import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class CashWithdrawalScreen extends StatelessWidget {
  const CashWithdrawalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const CustomAppBar(title: 'سحب نقدي'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.money, size: 80, color: AppTheme.goldColor.withOpacity(0.5)),
            const SizedBox(height: 16),
            Text('السحب النقدي', style: TextStyle(fontFamily: 'Changa', fontSize: 24, color: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkText : AppTheme.lightText)),
          ],
        ),
      ),
    );
  }
}
