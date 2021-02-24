import 'package:flutter_getx/models/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController{

  var cartItems=List<Product>().obs;

  var cartAddProducts=List<Product>().obs;

  int get count=>cartItems.length;

  int get cartCount=>cartAddProducts.fold(1, (previousValue, element) => previousValue+element.itemCount);

  double get totalPrice=> cartItems.fold(0, (sum, element) =>sum+element.price);

  addToCart(Product product){
    cartItems.add(product);
    //var list=cartItems.toSet().toList();
    cartAddProducts.assignAll(cartItems);

  }

  removeProduct(Product product){
    cartItems.remove(product);
  }
}