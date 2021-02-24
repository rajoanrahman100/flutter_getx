import 'package:get/state_manager.dart';


class Product {
  final int id;
  final String productName;
  final String productImage;
  final String productDescription;
  final double price;
  final int itemCount;

  Product({this.id, this.productName, this.productImage, this.productDescription, this.price,this.itemCount});

  final isFavorite = false.obs;

}