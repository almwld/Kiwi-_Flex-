import '../../widgets/simple_app_bar.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hasFavorites = false;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: CustomAppBar(title: 'المفضلة'),
      body: hasFavorites
          ? ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 5,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(color: AppTheme.goldColor.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                    child: const Icon(Icons.favorite, color: AppTheme.goldColor),
                  ),
                  title: Text('منتج ${index + 1}', style: TextStyle(fontFamily: 'Changa', color: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkText : AppTheme.lightText)),
                  subtitle: Text('${(index + 1) * 10000} ر.ي', style: const TextStyle(fontFamily: 'Changa', color: AppTheme.goldColor)),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline, color: AppTheme.error),
                    onPressed: () {},
                  ),
                ),
              ),
            )
          : Center(child: Text('لا توجد عناصر في المفضلة')),
    );
  }
}
