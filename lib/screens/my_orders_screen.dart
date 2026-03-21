import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hasOrders = false;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: CustomAppBar(title: 'طلباتي'),
      body: hasOrders
          ? ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 5,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  title: Text('طلب #${1000 + index}', style: TextStyle(fontFamily: 'Changa', color: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkText : AppTheme.lightText)),
                  subtitle: Text('${(index + 1) * 50000} ر.ي', style: const TextStyle(fontFamily: 'Changa', color: AppTheme.goldColor)),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: AppTheme.success.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                    child: const Text('مكتمل', style: TextStyle(fontFamily: 'Changa', color: AppTheme.success, fontSize: 12)),
                  ),
                  onTap: () => Navigator.pushNamed(context, '/order_detail'),
                ),
              ),
            )
          : Center(child: Text('لا توجد طلبات')),
    );
  }
}
