class ProductsModel {
  final List<Product> data;

  ProductsModel({required this.data});

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
          data: List<Product>.from(
        json['data'].map((item) => Product.fromJson(item)),
      ));
}

class Product {
  final int id;
  final String name;
  final double price;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        price: json['price']?.toDouble(),
        image: json['image'],
      );
}
