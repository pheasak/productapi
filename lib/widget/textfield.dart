// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/controller/payment_controller.dart';
import 'package:product/method/method.dart';

Widget NumberText(BuildContext context, String text, String hintText,
    TextEditingController controller, double size) {
  final controllpay = Get.find<PaymentController>();
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: 30,
            child: Text(
              text,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            )),
        Container(
          width: size,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 226, 226, 226)),
          child: TextField(
            // enabled: text == 'Expire Date' ? false : true,
            controller: controller,
            onTap: () {
              text == 'Expire Date'
                  ? Method().pickDateTime(
                      context,
                      onClicked: (datatime) {
                        controllpay.datetime = datatime.obs;
                      },
                    )
                  : null;
            },
            keyboardType: TextInputType.datetime,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: hintText,
                border: const OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
      ],
    ),
  );
}
