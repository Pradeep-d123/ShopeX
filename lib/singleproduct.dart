import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_using_getx/model.dart';
import 'package:flutter_application_using_getx/shopingcontroller.dart';
import 'package:get/get.dart';

class SingleProduct extends StatelessWidget {
  SingleProduct({super.key, required this.product});

  final Welcome product;

 late ProductLikeController productLikeController =
      Get.put(ProductLikeController(),tag: product.id.toString());

  @override
  Widget build(BuildContext context) {
    
    return Stack(
      children: [
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(product.imageLink),
              Text(product.name),
              Text(product.price)
            ],
          ),
        ),
        Obx(
          () => IconButton(
              onPressed: () {
                productLikeController.toggleLike(product.id);
              },
              icon: productLikeController.isFavorite.isFalse
                  ? Icon(Icons.favorite_outline)
                  : Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )),
        )
      ],
    );
  }
}
