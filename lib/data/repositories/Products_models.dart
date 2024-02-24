class ProductModel {
  final String title;
  final double price;
  final String description;
  final String brand;
  final String image_path;
  final String category;
  final int reviews;
  final int no_rating;
  final double rating;

  ProductModel(
      {required this.title,
      required this.price,
      required this.description,
      required this.brand,
      required this.image_path,
      required this.category,
      required this.reviews,
      required this.no_rating,
      required this.rating});
}

class BrandModel {
  final String name;
  final String image_path;
  BrandModel({required this.name, required this.image_path});
}
