import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:product/controller/counter.dart';
import 'package:product/controller/product2nd_controller.dart';
import 'package:product/model/product_model.dart';

class ProductControl extends GetxController
    with StateMixin<List<Productmodel>> {
  @override
  void onInit() {
    super.onInit();
    fetchdata();
  }

  Future<void> fetchdata() async {
    try {
      var respones = await Dio().get('https://fakestoreapi.com/products');
      if (respones.statusCode == 200) {
        var data = Productmodel().fromList(respones.data);
        // ignore: unnecessary_null_comparison
        if (data == null) {
          change(data, status: RxStatus.empty());
        } else {
          change(data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error('${respones.statusCode}'));
      }
    } catch (e) {
      rethrow;
    }
  }
}

// ignore: camel_case_types
class productBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductControl());
    Get.lazyPut(() => Product2ndController());
    Get.lazyPut(() => CounterControl());
  }
}
