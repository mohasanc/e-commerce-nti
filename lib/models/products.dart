class Product {
  final String image, name;
  final String? describtion;
  final double price;
  final String? category;
  final double? rating;

  Product({
    required this.image,
    required this.price,
    required this.name,
    this.describtion,
    this.category,
    this.rating,
  });

  factory Product.fromJsonToProduct(Map<String, dynamic> json) {
    return Product(
      name: json['title'],
      image: json['thumbnail'],
      price: json['price'],
      describtion: json['description'],
      category: json['category'],
      rating: json['rating'],
    );
  }
}
