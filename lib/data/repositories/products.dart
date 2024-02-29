import 'dart:convert';

import 'package:shopfusion/data/repositories/Products_models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopfusion/features/Home/ui/lists.dart';

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
      rating: 4.2),
  ProductModel(
      title: 'Acer Nitro V Gaming ',
      price: 74990,
      description:
          'Laptop 13th Gen Intel Core i5-13420H with RTX 3050 Graphics 6 GB VRAM, 144Hz Display (16 GB DDR5/512GB SSD/Windows 11 Home/Wi-Fi 6),15.6"(39.6cms) FHD ANV15-51',
      brand: 'Acer',
      image_path: 'https://m.media-amazon.com/images/I/51GGNToj7aL._SX679_.jpg',
      category: 'Electronics',
      reviews: 500,
      no_rating: 785,
      rating: 4.7,
      amount: 1),
  ProductModel(
      title: 'ASUS ROG Strix G17 ',
      price: 88990,
      description:
          ' 17.3-inch (43.94 cms) FHD 144Hz, AMD Ryzen 7-6800HS, RTX 3050 4GB Graphics, Gaming Laptop (16GB/512GB SSD/Windows 11/Gray/2.5 Kg),G713RC-HX109WS',
      brand: 'Asus',
      image_path: 'https://m.media-amazon.com/images/I/61GkvvDNnCL._SX679_.jpg',
      category: 'Electronics',
      reviews: 345,
      no_rating: 897,
      rating: 4.7,
      amount: 1),
  ProductModel(
      title: 'Lenovo Legion 5 Pro',
      price: 89990,
      description:
          'AMD Ryzen 7 5800H40cm 500Nits QHD Gaming Laptop(16GB/1TB SSD/RTX 3060 6GB GDDR6 Graphics/165Hz/Windows 11/Office 2021/RGB Backlit/3mnth Xbox Game Pass/Storm Grey/2.45Kg)82JQ00JCIN',
      brand: 'Lenovo',
      image_path: 'https://m.media-amazon.com/images/I/61tAKdpQQzL._SX679_.jpg',
      category: 'Electronics',
      reviews: 256,
      no_rating: 400,
      rating: 3.5,
      amount: 1),
  ProductModel(
      title: 'Apple 2023 MacBook Pro ',
      price: 319900,
      description: '(14-inch, M3 Max chip with 14‑core CPU and 30‑core GPU, 36GB Unified Memory, 1TB) - Space Black',
      brand: 'Apple',
      image_path: 'https://m.media-amazon.com/images/I/61RJn0ofUsL._SX679_.jpg',
      category: 'Electronics ',
      reviews: 1983,
      no_rating: 2034,
      rating: 4.2,
      amount: 1),
  ProductModel(
      title: 'boAt Nirvana 751',
      price: 4499,
      description:
          'boAt Nirvana 751 ANC Hybrid Active Noise Cancelling Bluetooth Wireless Over Ear Headphones with Up to 65H Playtime, ASAP Charge, Ambient Sound Mode, Immersive Sound, Carry Pouch(Gunmetal Grey)',
      brand: 'Boat',
      image_path: 'https://m.media-amazon.com/images/I/71ISIssoVFL._SX522_.jpg',
      category: 'Electronics',
      reviews: 4575,
      no_rating: 9987,
      rating: 4.0,
      amount: 1),
  ProductModel(
      title: 'OnePlus Bluetooth Wireless headphones',
      price: 1799,
      description:
          ' Bullets Z2  in Ear Earphones with Mic, Bombastic Bass - 12.4 Mm Drivers, 10 Mins Charge - 20 Hrs Music, 30 Hrs Battery Life (Magico Black)',
      brand: 'OnePlus',
      image_path: 'https://m.media-amazon.com/images/I/51UhwaQXCpL._SX679_.jpg',
      category: 'Electronics',
      reviews: 789,
      no_rating: 8986,
      rating: 4,
      amount: 1),
  ProductModel(
      title: 'Realme buds air 4',
      price: 3789,
      description:
          ' True Wireless in-Ear Earbuds with 42dB Active Noise Cancellation (ANC), Dual Device Pairing and 30 hrs Playtime with Fast Charging (Galaxy White)',
      brand: 'Realme',
      image_path: 'https://m.media-amazon.com/images/I/51DclWv+E3L._SX679_.jpg',
      category: 'Electronics',
      reviews: 789,
      no_rating: 9898,
      rating: 4.5,
      amount: 1)
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

double total = 0;
double discount = 0;
double delivery_charge = 100;
double final_total = 0;

calculateTotal() {
  total = 0;
  discount = 0;
  final_total = 0;
  for (var i = 0; i < cart.length; i++) {
    total = total + (cart[i].price * cart[i].amount);
  }
  discount = (total * 5) / 100;
  final_total = total - discount + delivery_charge;
}

shuffle_lists() {
  lists.shuffle();
  for (var i = 0; i < lists.length; i++) {
    lists[i].shuffle();
  }
}
