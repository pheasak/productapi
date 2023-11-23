import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/controller/counter.dart';
import 'package:product/widget/cart_list.dart';

class Cart extends GetView<CounterControl> {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: const CartWget(),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        height: 90,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Total',
                  style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 7, 251, 255),
                      fontWeight: FontWeight.bold),
                ),
                Obx(() => Text(
                      '\$ ${controller.producttotal}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color.fromARGB(255, 7, 164, 255)),
              child: TextButton(
                  onPressed: () {
                    Get.toNamed('/Checkout',
                        arguments: {'total': controller.producttotal});
                  },
                  child: const Text(
                    'Payment',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
