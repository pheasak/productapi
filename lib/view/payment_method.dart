import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/controller/payment_controller.dart';
import 'package:product/controller/paymentmethod_controller.dart';
import 'package:product/model/payment_card.dart';

class PaymentMethod extends GetView<PaymentMethodController> {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerpay = Get.find<PaymentController>();
    bool checking = false;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close,
                    size: 30,
                  )),
            ],
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                  child: Text(
                    'Payment method',
                    style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(
                  'Choose desired vehicle type. We offer cars suitable for most every day needs',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: List.generate(PaymentCard.lscard.length, (index) {
                    var data = PaymentCard.lscard[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: GestureDetector(
                          onTap: () {
                            checking = true;
                            if (checking == true) {
                              controller.index.value = index;
                              controllerpay.card.value = data.card;
                              controllerpay.name.value = data.name;
                            }
                          },
                          child: Obx(
                            () => Container(
                              height: 80,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 1.5,
                                    color: controller.index.value == index &&
                                            checking == true
                                        ? Colors.amber
                                        : Colors.transparent,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                        offset: Offset(1, 1),
                                        blurRadius: 2,
                                        blurStyle: BlurStyle.outer)
                                  ]),
                              child: Row(children: [
                                SizedBox(
                                  height: 75,
                                  width: 75,
                                  child: Image.asset(data.card),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Text(
                                  // ignore: unnecessary_string_interpolations
                                  '${data.name}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )
                              ]),
                            ),
                          )),
                    );
                  }),
                ),
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(
                  height: 40,
                  child: Text(
                    'CURRENT METHOD',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                ),
                Container(
                  height: 80,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 2,
                            blurStyle: BlurStyle.outer)
                      ]),
                  child: Row(children: [
                    const SizedBox(
                      height: 75,
                      width: 75,
                      child: Icon(
                        Icons.monetization_on_outlined,
                        size: 35,
                        color: Colors.amber,
                      ),
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Cash payment',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Defualt method',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Obx(() => Checkbox(
                          value: controller.check.value,
                          activeColor: Colors.amber,
                          onChanged: (value) {
                            controller.checking();
                          },
                        ))
                  ]),
                ),
              ],
            ),
          ))
        ],
      )),
      bottomNavigationBar: Container(
        height: 90,
        color: Colors.white,
        padding: const EdgeInsets.all(15),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(5)),
          child: TextButton(
            style: const ButtonStyle(),
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'Add Payment method',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
