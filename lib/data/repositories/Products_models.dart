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
  final int amount;

  ProductModel(
      {required this.title,
      required this.price,
      required this.description,
      required this.brand,
      required this.image_path,
      required this.category,
      required this.reviews,
      required this.no_rating,
      required this.rating, 
      required this.amount});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'desciption': description,
      'price': price,
      'brand': brand,
      'image_path': image_path,
      'category': category,
      'reviews': reviews,
      'no_rating': no_rating,
      'rating': rating,
      'amount': amount
    };
  }

  // Create a Product object from a Map
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        title: json['title'],
        price: json['price'],
        description: json['desciption'],
        brand: json['brand'],
        image_path: json['image_path'],
        category: json['category'],
        reviews: json['reviews'],
        no_rating: json['no_rating'],
        rating: json['rating'], 
        amount: json['amount']);
  }
}

class BrandModel {
  final String name;
  final String image_path;
  BrandModel({required this.name, required this.image_path});
}
