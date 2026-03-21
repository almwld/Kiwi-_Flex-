import '../widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/loading_widget.dart';
import '../models/product_model.dart';
import 'all_ads_screen.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentSlide = 0;
  bool _isLoading = true;
  List<ProductModel> _featuredProducts = [];
  List<ProductModel> _newProducts = [];

  final List<Map<String, dynamic>> _slides = [
    {'title': 'عرض خاص', 'subtitle': 'خصومات تصل إلى 50%', 'image': 'https://picsum.photos/id/1/400/200'},
    {'title': 'VIP عروض', 'subtitle': 'لعملائنا الكرام', 'image': 'https://picsum.photos/id/2/400/200'},
    {'title': 'أفضل المطاعم', 'subtitle': 'اكتشف أشهى الأطباق', 'image': 'https://picsum.photos/id/3/400/200'},
  ];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _featuredProducts = _getDummyProducts();
      _newProducts = _getDummyProducts().take(4).toList();
      _isLoading = false;
    });
  }

  List<ProductModel> _getDummyProducts() {
    return [
      ProductModel(
        id: '1',
        title: 'آيفون 15 برو ماكس',
        description: 'هاتف أيفون جديد بالكامل',
        price: 450000,
        oldPrice: 500000,
        currency: 'YER',
        images: ['https://picsum.photos/id/1/300/200'],
        category: 'إلكترونيات',
        subCategory: 'هواتف',
        sellerId: 'seller1',
        sellerName: 'متجر التقنية',
        sellerRating: 4.8,
        inStock: true,
        rating: 4.8,
        reviewCount: 120,
        createdAt: DateTime.now(),
      ),
      ProductModel(
        id: '2',
        title: 'لابتوب Dell XPS',
        description: 'لابتوب احترافي',
        price: 380000,
        currency: 'YER',
        images: ['https://picsum.photos/id/2/300/200'],
        category: 'إلكترونيات',
        subCategory: 'لابتوب',
        sellerId: 'seller2',
        sellerName: 'الحاسوب المتقدم',
        sellerRating: 4.5,
        inStock: true,
        rating: 4.5,
        reviewCount: 85,
        createdAt: DateTime.now(),
      ),
      ProductModel(
        id: '3',
        title: 'سيارة تويوتا كامري',
        description: 'سيارة نظيفة جداً',
        price: 8500000,
        currency: 'YER',
        images: ['https://picsum.photos/id/3/300/200'],
        category: 'سيارات',
        subCategory: 'سيارات للبيع',
        sellerId: 'seller3',
        sellerName: 'معرض السيارات',
        sellerRating: 4.9,
        inStock: true,
        rating: 4.9,
        reviewCount: 45,
        createdAt: DateTime.now(),
      ),
      ProductModel(
        id: '4',
        title: 'شقة فاخرة للإيجار',
        description: '3 غرف، 2 حمام',
        price: 80000,
        currency: 'YER',
        images: ['https://picsum.photos/id/4/300/200'],
        category: 'عقارات',
        subCategory: 'شقق للإيجار',
        sellerId: 'seller4',
        sellerName: 'العقارات الذهبية',
        sellerRating: 4.6,
        inStock: true,
        rating: 4.6,
        reviewCount: 30,
        createdAt: DateTime.now(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.lightBackground,
      appBar: const CustomAppBar(),
      body: _isLoading
          ? const LoadingWidget(message: 'جاري التحميل...')
          : RefreshIndicator(
              onRefresh: _loadData,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildCarousel(),
                    const SizedBox(height: 24),
                    _buildFeaturedProducts(),
                    const SizedBox(height: 24),
                    _buildNewProducts(),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildCarousel() {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            onPageChanged: (index, _) => setState(() => _currentSlide = index),
          ),
          items: _slides.map((slide) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(image: NetworkImage(slide['image']), fit: BoxFit.cover),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(slide['title'], style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text(slide['subtitle'], style: const TextStyle(color: Colors.white70, fontSize: 16)),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _slides.asMap().entries.map((entry) {
            return Container(
              width: _currentSlide == entry.key ? 24 : 8,
              height: 8,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: _currentSlide == entry.key ? AppTheme.goldColor : Colors.grey.withOpacity(0.3),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildFeaturedProducts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('منتجات مميزة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkText : AppTheme.lightText)),
              TextButton(onPressed: () => Navigator.pushNamed(context, '/all_ads'), child: const Text('المزيد', style: TextStyle(color: AppTheme.goldColor))),
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _featuredProducts.length,
            itemBuilder: (context, index) {
              final product = _featuredProducts[index];
              return GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailScreen(product: product))),
                child: Container(
                  width: 150,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkCard : AppTheme.lightCard,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                          child: Image.network(product.images.first, fit: BoxFit.cover, width: double.infinity),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(product.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNewProducts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('أحدث المنتجات', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkText : AppTheme.lightText)),
              TextButton(onPressed: () => Navigator.pushNamed(context, '/all_ads'), child: const Text('المزيد', style: TextStyle(color: AppTheme.goldColor))),
            ],
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: _newProducts.length,
          itemBuilder: (context, index) {
            final product = _newProducts[index];
            return GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailScreen(product: product))),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).brightness == Brightness.dark ? AppTheme.darkCard : AppTheme.lightCard,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.network(product.images.first, fit: BoxFit.cover, width: double.infinity),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(product.title, maxLines: 2, overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
