import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/controller/counter.dart';
import 'package:product/widget/rating.dart';

class DetailProduct1 extends GetView<CounterControl> {
  const DetailProduct1({super.key});

  @override
  Widget build(BuildContext context) {
    var trdb = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Center(
          child: Column(
        children: [
          Hero(
            tag: trdb!['id'] ?? 0,
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(trdb!['image']))),
            ),
          ),
          const Divider(
            color: Colors.black,
            height: 10,
            endIndent: 10,
            indent: 10,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                  child: Text(
                    '${trdb['title']}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Rating: ${trdb['rate']}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Rating(trdb!['rate']),
                    Text(
                      '\$ ${trdb['price']}',
                      style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                  child: Text(
                    'Detail',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                    height: 80,
                    child: Text(
                      '${trdb['descript']}',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    )),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          controller.descrement();
                        },
                        child: const Icon(
                          Icons.remove,
                          color: Color.fromARGB(255, 4, 251, 198),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GetX<CounterControl>(
                          builder: (controller) => Text(
                            '${controller.count}',
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        )),
                    ElevatedButton(
                        onPressed: () {
                          controller.increament();
                        },
                        child: const Icon(
                          Icons.add,
                          color: Color.fromARGB(255, 4, 251, 198),
                        )),
                    const Spacer(),
                    GetX<CounterControl>(
                      // init: ,
                      builder: (controller) {
                        return Text(
                          'Total: \$${(controller.count * trdb['price']).toStringAsFixed(2)}',
                          overflow: TextOverflow.clip,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        );
                      },
                    )
                  ],
                )
              ],
            ),
          ),
          CupertinoButton(
            child: Container(
              alignment: Alignment.center,
              height: 51,
              width: 190,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 4, 251, 198)),
              child: const Text(
                'Add to cart',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: () {
              controller.addProduct(trdb['product'], controller.count.value);
            },
          )
        ],
      )),
    );
  }
}
