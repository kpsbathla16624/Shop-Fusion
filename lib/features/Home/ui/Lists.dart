import 'package:shopfusion/data/repositories/Products_models.dart';
import 'package:shopfusion/data/repositories/products.dart';

List<ProductModel> others = products.where((element) => element.category == 'Shoes').toList();
List<ProductModel> mobiles = products.where((element) => element.category == 'Mobile').toList();
List<ProductModel> Electronics = products.where((element) => element.category == 'Electronics').toList();
List<ProductModel> home_etc = products.where((element) => element.category == 'Home').toList();
List<List<ProductModel>> lists = [others, mobiles, Electronics, home_etc];


