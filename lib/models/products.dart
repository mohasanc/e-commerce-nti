class Product {
  final String image, price, name;
  final String? describtion;

  Product({
    required this.image,
    required this.price,
    required this.name,
    this.describtion,
  });
}
