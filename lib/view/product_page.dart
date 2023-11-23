import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/controller/product_controller.dart';
import 'package:product/model/cartmodel.dart';
import 'package:product/widget/product_list.dart';
import 'package:product/widget/shimmer.dart';

class Productpage extends GetView<ProductControl> {
  const Productpage({super.key});
  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state!.length,
              itemBuilder: (context, index) {
                var data = state[index];
                var cart = Cartmodel(
                    image: data.image, price: data.price, title: data.title);
                return Product(data, cart, index);
              },
            ),
        onLoading: shimmer());
  }
}
