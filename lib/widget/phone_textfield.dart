import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/controller/payment_controller.dart';

// ignore: must_be_immutable
class PhoneNumber extends GetView<PaymentController> {
  const PhoneNumber({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(controller.textfield.length, (index) {
          return Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  width: 320,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 226, 226, 226)),
                  child: TextField(
                    focusNode: controller.focuslist[index],
                    controller: controller.textfield[index],
                    keyboardType: TextInputType.phone,
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                        hintText: 'Phone number',
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    CircleAvatar(
                      child: IconButton(
                        icon: Icon(index == controller.textfield.length - 1
                            ? Icons.add
                            : Icons.remove),
                        onPressed: () {
                          index == controller.textfield.length - 1
                              ? controller.addfield(index)
                              : controller.removefield(index);
                        },
                      ),
                    ),
                    controller.textfield.length > 1 &&
                            index == controller.textfield.length - 1
                        ? Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: CircleAvatar(
                              child: IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  controller.removefield(index);
                                },
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
