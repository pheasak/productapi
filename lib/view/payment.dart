// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/controller/payment_controller.dart';
import 'package:product/widget/image.dart';
import 'package:product/widget/list_pick_image.dart';
import 'package:product/widget/phone_textfield.dart';
import 'package:product/widget/textfield.dart';
import 'package:product/widget/textfield_typenum.dart';
import 'package:product/widget/title_text.dart';

// ignore: must_be_immutable
class Payment extends GetView<PaymentController> {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => gallaryImage(
                  controller.thumbnail.value,
                  controller.lsfile,
                  controller.thumbnailfile,
                  controller.listimage,
                  onClicked: (image, thumbnail, file, lsfile) {
                    image.map((e) => controller.listimage.add(e)).toList();
                    controller.thumbnail(thumbnail);
                    //print('controller-thumbnail: $thumbnail');
                    controller.thumbnailfile = file!;
                    lsfile.map((e) => controller.lsfile.add(e)).toList();
                  },
                ),
              ),
              TitleText(title: 'Card Number'),
              TextNumber(
                  hintText: 'Card number',
                  inputType: TextInputType.number,
                  controller: controller.cardnumController),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NumberText(
                      context,
                      'Expire Date',
                      'dd/mm/yy',
                      TextEditingController(
                          text:
                              '${controller.datetime.value.day}-${controller.datetime.value.month}-${controller.datetime.value.year}'),
                      170),
                  NumberText(context, 'CVV', '', controller.cvvController, 170)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TitleText(title: 'Name'),
              TextNumber(
                  hintText: 'Name',
                  inputType: TextInputType.name,
                  controller: controller.nameController),
              const SizedBox(
                height: 20,
              ),
              TitleText(title: 'Phone number'),
              const PhoneNumber(),
              const SizedBox(
                height: 20,
              ),
              const ImagePicked(),
              // OutlinedButton(
              //     onPressed: () {
              //     },
              //     child: Text('Choose image')),
              // const ScrollImage(),

              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 35,
                child: Text(
                  'Total bill',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 65,
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 233, 233, 233),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(fontSize: 16),
                      ),
                      const VerticalDivider(
                        endIndent: 5,
                        indent: 5,
                        color: Colors.grey,
                      ),
                      Text(
                        '\$ ${controller.data!['total'] ?? 0.0}',
                        style: const TextStyle(fontSize: 19),
                      ),
                      const Spacer(),
                      const VerticalDivider(
                        endIndent: 5,
                        indent: 5,
                        color: Colors.grey,
                      ),
                      const Icon(
                        Icons.monetization_on,
                        size: 30,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 120,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Colors.grey)),
                    child: TextButton(
                        onPressed: () {
                          Get.toNamed(
                            '/Payment',
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            controller.card.value == ''
                                ? const Center()
                                : SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Image.asset(controller.card.value),
                                  ),
                            Text(
                              controller.name.value == ''
                                  ? 'Paymeny method'
                                  : controller.name.value,
                              style: const TextStyle(
                                  fontSize: 17, color: Colors.grey),
                            ),
                            const Icon(
                              Icons.currency_exchange_outlined,
                              color: Colors.grey,
                            )
                          ],
                        )),
                  ),
                )),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 0, 150, 180)),
              child: TextButton(
                  onPressed: () {
                    print('==========================================');
                    print('Card Number: ${controller.cardnumController.text}');
                    print(
                        'Expire date: ${controller.datetime.value.day}-${controller.datetime.value.month}-${controller.datetime.value.year}');
                    print('CVV: ${controller.cvvController.text}');
                    print('Name: ${controller.nameController.text}');
                    for (var i in controller.textfield) {
                      print('Phone number: ${i.text}');
                    }
                    print('Total: \$${controller.data!['total']} ');
                    print('Pay by: ${controller.name.value}');
                    print('==========================================');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Pay |     \$ ${controller.data!['total'] ?? 0.0}',
                        style:
                            const TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
