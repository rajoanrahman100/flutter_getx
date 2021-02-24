import 'package:flutter_getx/models/product.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController{

  var products=List<Product>().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchProduct();
  }

  void fetchProduct()async{
    await Future.delayed(Duration(seconds: 1));

    var productResult=[
      Product(
        id: 1,productName: "First Product",productDescription: "This is fist",productImage: "abd",price: 200,itemCount: 0
      ),
      Product(
          id: 2,productName: "Second Product",productDescription: "This is second",productImage: "abd",price: 300,itemCount: 0
      ),
      Product(
          id: 3,productName: "Third Product",productDescription: "This is third",productImage: "abd",price: 400,itemCount: 0
      ),
    ];

    products.assignAll(productResult);
  }

}