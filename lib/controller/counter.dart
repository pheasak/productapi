import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/model/cartmodel.dart';
// import 'package:product/model/product_model.dart';

class CounterControl extends GetxController {
  RxInt count = 1.obs;
  RxInt count2nd = 1.obs;
  // List<Cartmodel> listcart = [];
  //void addtocart(Cartmodel cartmodel){
  //  listcart.add(cartmodel);
  //}

  final _product = {}.obs;
  void addProduct(Cartmodel product, int qty) {
    if (_product.containsKey(product)) {
      _product[product] += qty;
    } else {
      _product[product] = qty;
    }
    Get.snackbar('Fake shop', 'Added to cart',
        onTap: (snack) => Get.toNamed('/Cart'),
        forwardAnimationCurve: Curves.bounceIn);
  }

  void removeProduct(Cartmodel product) {
    if (_product.containsKey(product) && _product[product] == 1) {
      _product.removeWhere((key, value) => key == product);
    } else {
      _product[product]--;
    }
  }

  void delete(Cartmodel product) {
    if (_product.containsKey(product)) {
      _product.remove(product);
    }
  }

  void increamentProduct(Cartmodel product) {
    if (_product.containsKey(product)) {
      _product[product] += 1;
    } else {
      _product[product] = 1;
    }
  }

  // void descrementProduct(Cartmodel product) {
  //   if (_product.containsKey(product) && _product[product]-- == 1) {
  //     _product[product] = 1;
  //   }
  // }

  get productls => _product;
  get productsubtotal => _product.entries.map(
        (product) => product.key.price * product.value,
      );
  get producttotal => _product.isEmpty
      ? 0
      : _product.entries
          .map((product) => product.key.price * product.value)
          .toList()
          .reduce((value, element) => value + element)
          .toStringAsFixed(2);

  void increament() {
    count.value++;
  }

  void descrement() {
    if (count.value-- == 1) {
      count.value = 1;
    }
  }

  void increament2nd() {
    count2nd.value++;
  }

  void descrement2nd() {
    if (count2nd.value-- == 1) {
      count2nd.value = 1;
    }
  }
}
