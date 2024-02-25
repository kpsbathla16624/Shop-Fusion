import 'package:shopfusion/data/repositories/Products_models.dart';
import 'package:shopfusion/data/repositories/products.dart';

List<ProductModel> others = products.where((element) => element.category == 'Shoes').toList();
List<ProductModel> mobiles = products.where((element) => element.category == 'Mobile').toList();

List<List<ProductModel>> lists = [others, mobiles];
