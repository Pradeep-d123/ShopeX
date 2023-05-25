import 'package:flutter_application_using_getx/model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CartCountController extends GetxController {
  RxList<Welcome> carts = <Welcome>[].obs;

  addCart(Welcome item) {
    carts.add(item);
  }

  removecart(Welcome item) {
    carts.remove(item);
  }

// 30,20
  totalPrice() {
    double totalPrice = 0;

    for (var i = 0; i < carts.length; i++) {
      totalPrice = double.parse(carts[i].price) + totalPrice;
    }
    return totalPrice;
  }
}
