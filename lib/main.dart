import 'package:flutter/material.dart';
import 'package:flutter_application_using_getx/shopingcontroller.dart';
import 'package:flutter_application_using_getx/singleproduct.dart';

import 'package:get/get.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatelessWidget {
  Home({super.key});
  ProductController productController = Get.put(ProductController());
  CartCountController cartCountController = Get.put(CartCountController());
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        actions: [
          Stack(
            children: [
              Center(child: Icon(Icons.shopping_cart)),
              Positioned(
                left: 11,
                top: 3,
                child: Obx(
                  () =>
                     CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 8,
                    child: Center(
                        child: Text(
                      cartCountController.carts.length.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold)
                    )),
                  )
                )
              )
            ],
          )
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Shop X",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Expanded(
          child: Obx(
            () => productController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    itemCount: productController.products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 4,
                        crossAxisCount: 2,
                        childAspectRatio: .75),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    itemBuilder: (context, index) {
                      return SingleProduct(
                        product: productController.products[index],
                      );
                    }),
          ),
        )
      ]),
    );
  }
}

