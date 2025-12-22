class Product {
  final int? id;
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
    this.id,
  });

  factory Product.fromJsonToProduct(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['title'],
      image: json['thumbnail'],
      price: json['price'],
      describtion: json['description'],
      category: json['category'],
      rating: json['rating'],
    );
  }
}
