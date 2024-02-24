import 'package:shopfusion/data/repositories/Products.dart';

List others = [products.where((element) => element.category == 'Shoes').toList()];
List mobiles = [products.where((element) => element.category == 'mobiles').toList()];
