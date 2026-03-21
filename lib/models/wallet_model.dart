class WalletModel {
  final String id;
  final String userId;
  final double yerBalance;
  final double sarBalance;
  final double usdBalance;
  final DateTime createdAt;
  final DateTime updatedAt;

  WalletModel({
    required this.id,
    required this.userId,
    required this.yerBalance,
    required this.sarBalance,
    required this.usdBalance,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      yerBalance: (json['yer_balance'] ?? 0).toDouble(),
      sarBalance: (json['sar_balance'] ?? 0).toDouble(),
      usdBalance: (json['usd_balance'] ?? 0).toDouble(),
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : DateTime.now(),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'yer_balance': yerBalance,
      'sar_balance': sarBalance,
      'usd_balance': usdBalance,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
