import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/simple_app_bar.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  final _amountController = TextEditingController();
  final _accountController = TextEditingController();
  String _selectedCurrency = 'YER';
  String _selectedMethod = 'كريمي';
  bool _isLoading = false;

  final List<String> _currencies = ['YER', 'SAR', 'USD'];
  final List<String> _methods = ['كريمي', 'بنكي', 'تحويل', 'نقدي'];

  @override
  void dispose() {
    _amountController.dispose();
    _accountController.dispose();
    super.dispose();
  }

  Future<void> _withdraw() async {
    if (_amountController.text.isEmpty || _accountController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى ملء جميع الحقول', style: TextStyle(fontFamily: 'Changa')),
          backgroundColor: AppTheme.error,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم إرسال طلب السحب بنجاح', style: TextStyle(fontFamily: 'Changa')),
          backgroundColor: AppTheme.success,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const CustomAppBar(title: 'سحب'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [AppTheme.goldColor, AppTheme.goldLight]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('الرصيد الحالي', style: TextStyle(fontFamily: 'Changa', fontSize: 14, color: AppTheme.darkText)),
                  const SizedBox(height: 8),
                  const Text('125,000 ر.ي', style: TextStyle(fontFamily: 'Changa', fontSize: 28, fontWeight: FontWeight.bold, color: AppTheme.darkText)),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Text('العملة', style: TextStyle(fontFamily: 'Changa', fontSize: 16, fontWeight: FontWeight.w600, color: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkText : AppTheme.lightText)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              children: _currencies.map((currency) {
                return ChoiceChip(
                  label: Text(currency, style: TextStyle(fontFamily: 'Changa', color: _selectedCurrency == currency ? AppTheme.darkText : Theme.of(context).brightness == Brightness.dark ? AppTheme.darkText : AppTheme.lightText)),
                  selected: _selectedCurrency == currency,
                  selectedColor: AppTheme.goldColor,
                  onSelected: (selected) => setState(() => _selectedCurrency = currency),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            Text('المبلغ', style: TextStyle(fontFamily: 'Changa', fontSize: 16, fontWeight: FontWeight.w600, color: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkText : AppTheme.lightText)),
            const SizedBox(height: 12),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.right,
              style: const TextStyle(fontFamily: 'Changa'),
              decoration: InputDecoration(
                hintText: 'أدخل المبلغ',
                filled: true,
                fillColor: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkCard : AppTheme.lightCard,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 24),
            Text('رقم الحساب/الجوال', style: TextStyle(fontFamily: 'Changa', fontSize: 16, fontWeight: FontWeight.w600, color: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkText : AppTheme.lightText)),
            const SizedBox(height: 12),
            TextField(
              controller: _accountController,
              keyboardType: TextInputType.phone,
              textAlign: TextAlign.right,
              style: const TextStyle(fontFamily: 'Changa'),
              decoration: InputDecoration(
                hintText: 'أدخل رقم الحساب أو الجوال',
                filled: true,
                fillColor: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkCard : AppTheme.lightCard,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 24),
            Text('طريقة السحب', style: TextStyle(fontFamily: 'Changa', fontSize: 16, fontWeight: FontWeight.w600, color: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkText : AppTheme.lightText)),
            const SizedBox(height: 12),
            ..._methods.map((method) => RadioListTile<String>(
              title: Text(method, style: const TextStyle(fontFamily: 'Changa')),
              value: method,
              groupValue: _selectedMethod,
              activeColor: AppTheme.goldColor,
              onChanged: (value) => setState(() => _selectedMethod = value!),
            )).toList(),
            const SizedBox(height: 32),
            CustomButton(text: 'سحب', onPressed: _withdraw, isLoading: _isLoading),
          ],
        ),
      ),
    );
  }
}
