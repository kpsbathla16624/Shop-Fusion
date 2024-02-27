import 'dart:convert';

import 'package:shopfusion/data/repositories/Products_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<ProductModel> products = [
  // category = shoes
  ProductModel(
      amount: 1,
      title: 'Sneakers girls',
      price: 1099,
      description: ' Sylish sneakers for girls',
      brand: 'Nike',
      image_path:
          'https://rukminim2.flixcart.com/image/612/612/xif0q/shopsy-kids-shoe/d/p/j/5-112-trendly-reefox-original-imagwccyhqrfghxp.jpeg?q=70',
      category: 'Shoes',
      reviews: 3000,
      no_rating: 5000,
      rating: 4.3),
  ProductModel(
      amount: 1,
      title: 'Sports/ Running Shoes ',
      price: 999,
      description: 'Blue sports shoes',
      brand: 'Addidas',
      image_path:
          'https://rukminim2.flixcart.com/image/612/612/kskotjk0/shoe/k/8/v/7-441-blue-1234-bruton-blue-orange-original-imag63xd94c76ehg.jpeg?q=70',
      category: 'Shoes',
      reviews: 2000,
      no_rating: 3000,
      rating: 4.6),
  ProductModel(
      amount: 1,
      title: 'Formals for men ',
      price: 899,
      description: '',
      brand: 'Bata',
      image_path: 'https://rukminim2.flixcart.com/image/612/612/xif0q/shoe/o/m/y/-original-imagzry3gugpvqty.jpeg?q=70',
      category: 'Shoes',
      reviews: 987,
      no_rating: 1890,
      rating: 4.0),
  ProductModel(
      amount: 1,
      title: 'White Sneakers ',
      price: 799,
      description: 'Stylish & Trending Outdoor Walking Comfortable Sneakers For Men  (White)',
      brand: 'Puma',
      image_path:
          'https://rukminim2.flixcart.com/image/612/612/xif0q/shoe/v/c/g/8-2082-white-walkers-white-original-imag5y96fmgrfugx-bb.jpeg?q=70',
      category: 'Shoes',
      reviews: 568,
      no_rating: 890,
      rating: 3.9),
  ProductModel(
      amount: 1,
      title: 'Chelsa Boots',
      price: 1259,
      description: 'Anglo-2 Chelsea Boots For Men  (Black)',
      brand: 'RED TAPE ',
      image_path:
          'https://rukminim2.flixcart.com/image/612/612/xif0q/shoe/v/i/z/9-bfs-621-9-big-fox-black-original-imagprpe3zhgtgcw.jpeg?q=70',
      category: 'Shoes',
      reviews: 838,
      no_rating: 2500,
      rating: 4.6),
  ProductModel(
      amount: 1,
      title: 'Boys/Mens Snekers ',
      price: 5999,
      description: 'Boys and mens Boots outdoors shoo High Tops For Men  (White, Blue)',
      brand: 'Nike',
      image_path:
          'https://rukminim2.flixcart.com/image/612/612/xif0q/shoe/y/6/n/10-tennis-shoes-lutton-white-sky-original-imagx27ysua6f4nf.jpeg?q=70',
      category: 'Shoes',
      reviews: 909,
      no_rating: 3000,
      rating: 4.8),
  ProductModel(
      amount: 1,
      title: 'Boys sports shoes',
      price: 799,
      description: 'Exclusive Affordable Collection of Trendy & Stylish Sport Sneakers Shoes Walking Shoes For Men  (Blue)',
      brand: 'Campus',
      image_path:
          'https://rukminim2.flixcart.com/image/832/832/xif0q/shoe/y/k/n/7-9567-7-world-wear-footwear-blue-original-imagp4cfzybhe7gc.jpeg?q=70&crop=false',
      category: 'Shoes',
      reviews: 579,
      no_rating: 2000,
      rating: 4.5),
  ProductModel(
      amount: 1,
      title: 'Outdoor boots',
      price: 1599,
      description: 'Outdoor durable shoes for men ',
      brand: 'Woodland',
      image_path: 'https://rukminim2.flixcart.com/image/612/612/xif0q/shoe/t/q/m/-original-imaggckgvpad5hgp.jpeg?q=70',
      category: 'Shoes',
      reviews: 3789,
      no_rating: 6000,
      rating: 4.0),

  //mobiles
  ProductModel(
      amount: 1,
      title: 'Iphone 13 ',
      price: 52999,
      description: 'Apple Iphone 13 128 Gb ',
      brand: 'Apple',
      image_path:
          'https://rukminim2.flixcart.com/image/312/312/ktketu80/mobile/6/n/d/iphone-13-mlpg3hn-a-apple-original-imag6vpyghayhhrh.jpeg?q=70',
      category: 'Mobile',
      reviews: 3456,
      no_rating: 7000,
      rating: 4.8),
  ProductModel(
      amount: 1,
      title: 'Vivo V25',
      price: 27999,
      description: 'Vivo v25 , surfing blue , 8/128 GB ',
      brand: 'Vivo',
      image_path: 'https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/x/6/i/-original-imagg4kcj7ew4xgh.jpeg?q=70',
      category: 'Mobile',
      reviews: 50598,
      no_rating: 99890,
      rating: 4.5),
  ProductModel(
      amount: 1,
      title: 'Vivo T2x 5G ',
      price: 12999,
      description: 'vivo T2x 5G (Marine Blue, 128 GB)  (6 GB RAM)',
      brand: 'Vivo',
      image_path: 'https://rukminim2.flixcart.com/image/312/312/xif0q/mobile/k/u/n/-original-imagzjhwtfthcmzz.jpeg?q=70',
      category: 'Mobile',
      reviews: 48590,
      no_rating: 99325,
      rating: 4.1),
  ProductModel(
      amount: 1,
      title: 'realme 12 Pro+ 5G ',
      price: 29999,
      description: 'realme 12 Pro+ 5G (Submarine Blue, 128 GB)  (8 GB RAM)',
      brand: 'Realme ',
      image_path:
          'https://rukminim2.flixcart.com/image/416/416/xif0q/mobile/g/t/u/-original-imagxhd5xtjuwnqz.jpeg?q=70&crop=false',
      category: 'Mobile',
      reviews: 4959,
      no_rating: 244848,
      rating: 4.2)
];

List<ProductModel> cart = [];
List<ProductModel> wislist = [];

// Save cart data to SharedPreferences
Future<void> saveCartData(List<ProductModel> cart) async {
  final prefs = await SharedPreferences.getInstance();
  final cartData = cart.map((product) => product.toJson()).toList();
  await prefs.setString('cart', jsonEncode(cartData));
}

// Load cart data from SharedPreferences
Future<List<ProductModel>> loadCartData() async {
  final prefs = await SharedPreferences.getInstance();
  final cartString = prefs.getString('cart');
  if (cartString != null) {
    final List<dynamic> cartData = jsonDecode(cartString);
    return cartData.map((data) => ProductModel.fromJson(data)).toList();
  }
  return [];
}
