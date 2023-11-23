import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/controller/counter.dart';
import 'package:product/controller/product2nd_controller.dart';
import 'package:product/model/cartmodel.dart';
import 'package:product/widget/shimmer.dart';

class ProductPage2 extends GetView<Product2ndController> {
  const ProductPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        (state) => ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state!.length,
              itemBuilder: (context, index) {
                var data = state[index];
                var cart = Cartmodel(
                    image: data.category!.image,
                    price: data.price,
                    title: data.title);
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed('/Detail2', arguments: {
                        'product': cart,
                        'id': data.id,
                        'title': data.title,
                        'images': data.images,
                        'image': data.category!.image,
                        'price': data.price,
                        'descript': data.decription,
                        'created': data.creationAt,
                        'updated': data.updatedAt,
                      });
                      Get.lazyPut(() => CounterControl());
                      Get.find<CounterControl>().count2nd.value = 1;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        leading: Hero(
                          tag: data.id!,
                          child: Container(
                            width: 90,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        NetworkImage('${data.category!.image}'),
                                    fit: BoxFit.contain)),
                          ),
                        ),
                        title: Text(
                          '${data.title}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${data.decription}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '\$ ${data.price}',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
        onLoading: shimmer());
  }
}
