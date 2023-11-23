import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:product/model/product2_model.dart';

class Product2ndController extends GetxController
    with StateMixin<List<ProductmodelSecond>> {
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var respones =
          await Dio().get('https://api.escuelajs.co/api/v1/products');
      if (respones.statusCode == 200) {
        var pro = ProductmodelSecond().getTolist(respones.data);
        // ignore: unnecessary_null_comparison
        if (pro == null) {
          change(pro, status: RxStatus.empty());
        } else {
          change(pro, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error('${respones.statusCode}'));
      }
    } catch (e) {
      rethrow;
    }
  }
}
