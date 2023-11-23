import 'package:get/get.dart';

class PaymentMethodController extends GetxController {
  RxBool check = false.obs;
  RxInt index = 0.obs;
  void checking() {
    if (check.value == false) {
      check(true);
    } else {
      check(false);
    }
  }
}

class PaymentMethodBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PaymentMethodController());
  }
}
