import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_using_getx/controller/cart_controller.dart';
import 'package:flutter_application_using_getx/singleproduct.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  CartCountController cartCountController = Get.find<CartCountController>();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text("My cart"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: cartCountController.carts.length,
                  itemBuilder: (context, index) {
                    return SingleProduct(
                        width: MediaQuery.of(context).size.width,
                        product: cartCountController.carts[index]);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                          "Item Count : ${cartCountController.carts.length}"),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text("Cart Amount : ${cartCountController.totalPrice()}"),
                      ))
                ],
              ),
            )
          ],
        ));
  }
}
