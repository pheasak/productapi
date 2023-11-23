import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/controller/payment_controller.dart';
import 'package:product/method/method.dart';

class ImagePicked extends GetView<PaymentController> {
  const ImagePicked({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: List.generate(controller.imagepicked.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: GestureDetector(
                onTap: () {
                  controller.imagepicked[index].isEmpty
                      ? Method().pickImage('gallery',
                          onClicked: (base64, file) {
                          controller.imagepicked[index] = base64;
                        })
                      : AwesomeDialog(
                          context: context,
                          dialogType: DialogType.question,
                          // autoHide: Duration(minutes: 1),
                          // animType: AnimType.scale,
                          // reverseBtnOrder: true,
                          title: 'What do you want to do ?',
                          btnCancelText: 'Remove',
                          btnOkText: 'Replace',
                          btnOkOnPress: () {
                            controller.imagepicked[index] = '';
                            Method().pickImage('gallery',
                                onClicked: (base64, file) {
                              controller.imagepicked[index] = base64;
                            });
                          },
                          btnCancelOnPress: () {
                            controller.imagepicked[index] = '';
                          },
                        ).show();
                },
                child: controller.imagepicked[index].isNotEmpty
                    ? Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.memory(
                              base64Decode(controller.imagepicked[index]),
                              fit: BoxFit.fill,
                              width: double.infinity,
                              height: double.infinity,
                            )),
                      )
                    : Container(
                        height: 170,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 226, 226, 226),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Icons.add_circle_outline,
                          size: 40,
                          color: Colors.grey,
                        ),
                      ),
              ),
            );
          }),
        ));
  }
}
