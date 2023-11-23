import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/controller/counter.dart';
import 'package:product/model/cartmodel.dart';
import 'package:product/model/product_model.dart';

// ignore: non_constant_identifier_names
Widget Product(
  Productmodel data,
  Cartmodel cart,
  int index,
) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: GestureDetector(
      onTap: () {
        Get.toNamed('/Detail1', arguments: {
          'product': cart,
          'id': data.id,
          'title': data.title,
          'price': data.price,
          'descript': data.description,
          'rate': double.parse(data.rating!.rate.toString()),
          'image': data.image,
          'index': index,
        });
        Get.lazyPut(() => CounterControl());
        Get.find<CounterControl>().count.value = 1;
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
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage('${data.image}'),
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
                '${data.description}',
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
          trailing: SizedBox(
              width: 45,
              child: Row(
                children: [
                  Text('${data.rating!.rate}'),
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ],
              )),
        ),
      ),
    ),
  );
}
