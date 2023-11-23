import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/controller/payment_controller.dart';
import 'package:product/controller/paymentmethod_controller.dart';
import 'package:product/controller/product_controller.dart';
import 'package:product/view/cart.dart';
import 'package:product/view/detail.dart';
import 'package:product/view/detail_product1.dart';
import 'package:product/view/home_main.dart';
import 'package:product/view/payment.dart';
import 'package:product/view/payment_method.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: productBinding(),
      getPages: [
        GetPage(
          name: '/Detail2',
          page: () => const DetailPage(),
        ),
        GetPage(
          name: '/Detail1',
          page: () => const DetailProduct1(),
        ),
        GetPage(name: '/Cart', page: () => const Cart()),
        GetPage(
            name: '/Checkout',
            page: () => const Payment(),
            bindings: [PaymentBinding()]),
        GetPage(
            name: '/Payment',
            page: () => const PaymentMethod(),
            binding: PaymentMethodBindings())
      ],
      home: const HomePage(),
    );
  }
}
