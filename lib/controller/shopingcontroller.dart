import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_using_getx/model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List<Welcome> products = [];
  RxBool isLoading = true.obs;
  RxBool isfavorite = false.obs;
  Dio dio = Dio();
  @override
  void onInit() {
    feacthpproducts();
    super.onInit();
  }

  feacthpproducts() async {
    try {
      isLoading.value = true;
      final response = await dio.get(
          "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline");
      if (response.statusCode == 200) {
        print(response.data.runtimeType);
        for (var i = 0; i < response.data.length; i++) {
          products.add(Welcome.fromJson(response.data[i]));
        }
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }
}

