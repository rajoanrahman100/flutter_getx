import 'package:ars_progress_dialog/ars_progress_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/controller/cartController.dart';
import 'package:flutter_getx/controller/shoppingController.dart';
import 'package:flutter_getx/models/customProgress.dart';
import 'package:flutter_getx/views/cartAddedItems.dart';
import 'package:get/get.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  ArsProgressDialog _progressDialog;


  @override
  Widget build(BuildContext context) {

    _progressDialog= buildArsProgressDialog(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (_, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${controller.products[index].productName}',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text('${controller.products[index].productDescription}'),
                                    ],
                                  ),
                                  Text('\$${controller.products[index].price}', style: TextStyle(fontSize: 24)),
                                ],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  cartController.addToCart(controller.products[index]);
                                },
                                color: Colors.blue,
                                textColor: Colors.white,
                                child: Text('Add to Cart'),
                              ),
                              IconButton(icon: Icon(Icons.delete), onPressed:(){
                                controller.products.removeAt(index);

                              })
                              // Obx(() => IconButton(
                              //       icon: controller.products[index].isFavorite.value ? Icon(Icons.check_box_rounded) : Icon(Icons.check_box_outline_blank_outlined),
                              //       onPressed: () {
                              //         controller.products[index].isFavorite.toggle();
                              //       },
                              //     ))
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            GetX<CartController>(builder: (controller) {
              return Text(
                "total amount:  ${controller.totalPrice}",
                style: TextStyle(fontSize: 20.0),
              );
            }),

            SizedBox(
              height: 60.0,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.amber,
          icon: Icon(
            Icons.add_shopping_cart_rounded,
            color: Colors.black,
          ),
          label: GetX<CartController>(builder: (controller) {
            return GestureDetector(
              onTap: (){


                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartAddedItems()),
                );
              },
              child: Text(
                controller.count.toString(),
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            );
          }),
        ),
      ),
    );
  }
}
