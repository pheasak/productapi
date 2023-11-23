// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextNumber extends StatelessWidget {
  String hintText;
  TextInputType inputType;
  TextEditingController controller;
  TextNumber(
      {super.key,
      required this.hintText,
      required this.inputType,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 226, 226, 226)),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
            hintText: hintText,
            border: const OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}
