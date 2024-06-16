class Product {
  final String productName;
  final String imageUrl;
  final String productUrl;
  final String description;
  final double price;
  int quantity;
  final bool isLocal;

  Product({
    required this.productName,
    required this.imageUrl,
    required this.productUrl,
    required this.description,
    required this.price,
    this.quantity = 1,
    this.isLocal = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productName: json['title'] ?? 'Unknown',
      imageUrl: json['thumbnail'] ?? '',
      productUrl: json['productUrl'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      quantity: json['quantity'] ?? 1,
      isLocal: json['isLocal'] ?? false,
    );
  }
}
