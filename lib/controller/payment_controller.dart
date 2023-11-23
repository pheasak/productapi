import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController {
  final cardnumController = TextEditingController();
  final cvvController = TextEditingController();
  final nameController = TextEditingController();
  RxList<String> imagepicked = <String>['', '', ''].obs;
  RxList<String> listimage = <String>[].obs;
  Rx<DateTime> datetime = DateTime.now().obs;
  RxList<TextEditingController> textfield =
      <TextEditingController>[TextEditingController()].obs;
  RxList<FocusNode> focuslist = <FocusNode>[FocusNode()].obs;
  var total = 0.0.obs;
  var name = ''.obs;
  var card = ''.obs;
  List<File> lsfile = [];
  File thumbnailfile = File('');
  RxString thumbnail = ''.obs;
  // ignore: prefer_typing_uninitialized_variables
  late var data;
  @override
  void onInit() {
    super.onInit();
    data = Get.arguments;
    // ignore: unused_local_variable
    for (var i in focuslist) {
      i = FocusNode();
    }
  }

  @override
  void dispose() {
    for (var i in focuslist) {
      i.dispose();
    }
    super.dispose();
  }

  void addfield(index) {
    textfield.add(TextEditingController());
    focuslist.add(FocusNode());
    focuslist[index + 1].requestFocus();
    // [
    //   {
    //     'text': TextEditingController(),
    //     'node': FocusNode(),
    //   }
    // ];
  }

  void removefield(int index) {
    textfield.removeAt(index);
    focuslist.removeAt(index);
  }
}

class PaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentController());
  }
}
