import '../widgets/custom_app_bar.dart';
import '../../widgets/simple_app_bar.dart';
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  final List<Map<String, String>> faqs = const [
    {'question': 'كيف أقوم بإنشاء حساب؟', 'answer': 'يمكنك إنشاء حساب من خلال الضغط على زر إنشاء حساب وملء البيانات المطلوبة.'},
    {'question': 'كيف أضيف إعلان؟', 'answer': 'اضغط على زر + في الشريط السفلي واملأ تفاصيل الإعلان.'},
    {'question': 'كيف أدفع؟', 'answer': 'يمكنك الدفع من خلال المحفظة الإلكترونية أو التحويل البنكي.'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: CustomAppBar(title: 'الأسئلة الشائعة'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: faqs.length,
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ExpansionTile(
            title: Text(faqs[index]['question']!, style: TextStyle(fontFamily: 'Changa', color: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkText : AppTheme.lightText)),
            children: [Padding(padding: const EdgeInsets.all(16), child: Text(faqs[index]['answer']!, style: TextStyle(fontFamily: 'Changa', color: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkTextSecondary : AppTheme.lightTextSecondary)))],
          ),
        ),
      ),
    );
  }
}
