import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_using_getx/model.dart';
import 'package:flutter_application_using_getx/controller/shopingcontroller.dart';
import 'package:get/get.dart';

import 'controller/productlike_controller.dart';

class SingleProduct extends StatelessWidget {
  SingleProduct({super.key, required this.product, this.width});
  final double? width;

  final Welcome product;

  late ProductLikeController productLikeController =
      Get.put(ProductLikeController(), tag: product.id.toString());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          child: SizedBox(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(product.imageLink),
                Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 13),
                Text(
                  "${product.price} ₹ ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        Obx(
          () => IconButton(
              onPressed: () {
                productLikeController.toggleLike(product);
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
