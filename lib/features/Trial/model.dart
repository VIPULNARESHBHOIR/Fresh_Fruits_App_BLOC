class Product {
  final int id;
  final String title;
  final String thumbnail;

  Product({required this.id, required this.title, required this.thumbnail});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      thumbnail: json['thumbnail'],
    );
  }
}
