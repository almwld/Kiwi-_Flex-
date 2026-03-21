import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar.dart';

class SellerDashboard extends StatelessWidget {
  const SellerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'لوحة تحكم البائع'),
      body: const Center(child: Text('لوحة تحكم البائع - قيد التطوير')),
    );
  }
}
