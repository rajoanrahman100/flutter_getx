import 'package:flutter/material.dart';
import 'package:flutter_getx/controller/cartController.dart';
import 'package:get/get.dart';

class CartAddedItems extends StatelessWidget {

  final cartController = Get.put(CartController());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: GetX<CartController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.cartAddProducts.length,
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
                                        '${controller.cartAddProducts[index].productName}',
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      Text('${controller.cartAddProducts[index].productDescription}'),
                                    ],
                                  ),

                                  Text("total Items ${controller.cartCount}")
                                ],
                              ),
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
      ),
    );
  }
}
