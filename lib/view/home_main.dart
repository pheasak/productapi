import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/controller/counter.dart';
import 'package:product/view/product_page.dart';
import 'package:product/view/product_page2.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends GetView<CounterControl> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 211, 209, 209),
        appBar: AppBar(
          title: const Text('Fake Shop'),
          actions: [
            badges.Badge(
              badgeAnimation: const badges.BadgeAnimation.fade(
                  loopAnimation: false,
                  curve: Curves.bounceIn,
                  toAnimate: true,
                  animationDuration: Duration(milliseconds: 3)),
              badgeContent: Obx(() => Text(
                    '${controller.productls.length}',
                    style: const TextStyle(color: Colors.white),
                  )),
              position: badges.BadgePosition.topEnd(
                end: 5,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                ),
                onPressed: () {
                  Get.toNamed('/Cart');
                },
              ),
            )
          ],
          bottom: TabBar(
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.grey,
              labelColor: Colors.green,
              onTap: (value) {
                // ignore: avoid_print
                return print(value);
              },
              tabs: const [
                Tab(
                  text: 'Product 1',
                ),
                Tab(
                  text: 'Product 2',
                )
              ]),
        ),
        body: const TabBarView(children: [Productpage(), ProductPage2()]),
      ),
    );
  }
}
