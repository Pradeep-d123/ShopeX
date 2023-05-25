import 'package:flutter_application_using_getx/controller/shopingcontroller.dart';
import 'package:flutter_application_using_getx/model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'cart_controller.dart';

class ProductLikeController extends GetxController {
  RxBool isFavorite = false.obs;
  final CartCountController cartCountController =
      Get.find<CartCountController>();
  toggleLike(Welcome item) {
    isFavorite.value = !isFavorite.value;
    if (isFavorite.value) {
      cartCountController.addCart(item);
    } else {
      cartCountController.removecart(item );
    }
  }
}