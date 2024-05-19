class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final bool   isActive;
  final List<String> images;
  final int stock;
  final String categoryId;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.isActive,
    required this.stock,
    required this.categoryId,
  });

}