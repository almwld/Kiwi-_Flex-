import 'dart:convert';

class ProductModel {
  final String id;
  final String title;
  final String description;
  final double price;
  final double? oldPrice;
  final String currency;
  final List<String> images;
  final String category;
  final String subCategory;
  final String sellerId;
  final String sellerName;
  final double sellerRating;
  final String? sellerAvatar;
  final bool inStock;
  final double rating;
  final int reviewCount;
  final bool isFeatured;
  final int? discountPercentage;
  final int views;
  final String status;
  final DateTime createdAt;
  final DateTime? updatedAt;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.oldPrice,
    required this.currency,
    required this.images,
    required this.category,
    required this.subCategory,
    required this.sellerId,
    required this.sellerName,
    required this.sellerRating,
    this.sellerAvatar,
    required this.inStock,
    required this.rating,
    required this.reviewCount,
    this.isFeatured = false,
    this.discountPercentage,
    this.views = 0,
    this.status = 'active',
    required this.createdAt,
    this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<String> imagesList = [];
    if (json['images'] != null) {
      if (json['images'] is List) {
        imagesList = List<String>.from(json['images']);
      } else if (json['images'] is String) {
        try {
          imagesList = List<String>.from(jsonDecode(json['images']));
        } catch (e) {
          imagesList = [json['images'].toString()];
        }
      }
    }
    return ProductModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      oldPrice: json['old_price'] != null ? (json['old_price'] as num).toDouble() : null,
      currency: json['currency'] ?? 'YER',
      images: imagesList,
      category: json['category'] ?? '',
      subCategory: json['sub_category'] ?? '',
      sellerId: json['seller_id'] ?? '',
      sellerName: json['seller_name'] ?? '',
      sellerRating: (json['seller_rating'] ?? 0).toDouble(),
      sellerAvatar: json['seller_avatar'],
      inStock: json['in_stock'] ?? true,
      rating: (json['rating'] ?? 0).toDouble(),
      reviewCount: json['review_count'] ?? 0,
      isFeatured: json['is_featured'] ?? false,
      discountPercentage: json['discount_percentage'],
      views: json['views'] ?? 0,
      status: json['status'] ?? 'active',
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : DateTime.now(),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }

  String get formattedPrice {
    if (price >= 1000000) return '${(price / 1000000).toStringAsFixed(1)}M';
    if (price >= 1000) return '${(price / 1000).toStringAsFixed(0)}K';
    return price.toStringAsFixed(0);
  }

  String get currencySymbol {
    switch (currency) {
      case 'USD': return '\$';
      case 'SAR': return 'ر.س';
      default: return 'ر.ي';
    }
  }
}
