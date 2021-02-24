import 'package:flutter_getx/models/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController{

  var cartItems=List<Product>().obs;

  var cartAddProducts=List<Product>().obs;

  int get count=>cartItems.length;

  int get cartCount=>cartAddProducts.fold(1, (previousValue, element) => previousValue+element.itemCount);

  double get totalPrice=> cartItems.fold(0, (sum, element) =>sum+element.price);

  addToCart(Product product){

    if(cartItems.contains(product)){
      print("alredy added in cart");
    }else{
      cartItems.add(product);
      cartAddProducts.assignAll(cartItems);
    }


    // cartItems.forEach((element) {
    //   if(cartItems.contains(element)){
    //     var list=[];
    //     list.add(element);
    //     print("Cart items length ${list.length}");
    //   }
    // });
    //var list=cartItems.toSet().toList();
   // cartAddProducts.assignAll(list);


  }

  removeProduct(Product product){
    cartItems.remove(product);
  }
}