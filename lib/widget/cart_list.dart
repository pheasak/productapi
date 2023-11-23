import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/controller/counter.dart';

// ignore: non_constant_identifier_names
class CartWget extends StatefulWidget {
  const CartWget({super.key});

  @override
  State<CartWget> createState() => _CartWgetState();
}

class _CartWgetState extends State<CartWget> {
  bool stateanimate = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        stateanimate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CounterControl>();

    return Obx(() => ListView.builder(
          primary: false,
          shrinkWrap: true,
          itemCount: controller.productls.length,
          itemBuilder: (context, index) {
            var data = controller.productls.keys.toList()[index];
            // stateanimate = controller.state.value;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400 + (index * 100)),
                curve: Curves.easeInOut,
                transform: Matrix4.translationValues(
                    stateanimate ? 0 : MediaQuery.of(context).size.width, 0, 0),
                child: Stack(children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 80,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                image: DecorationImage(
                                    image: NetworkImage('${data.image}'),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 350,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  '${data.title}',
                                  maxLines: 2,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '\$ ${data.price}',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 35,
                            width: 117,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  width: 2,
                                  style: BorderStyle.solid,
                                  color:
                                      const Color.fromARGB(255, 0, 186, 207)),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      color: const Color.fromARGB(
                                          255, 0, 186, 207),
                                      onPressed: () {
                                        controller.removeProduct(data);
                                      },
                                      icon: const Icon(
                                        Icons.remove,
                                        size: 18,
                                      )),
                                  Text(
                                    '${controller.productls.values.toList()[index]}',
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 0, 186, 207)),
                                  ),
                                  IconButton(
                                      color: const Color.fromARGB(
                                          255, 0, 186, 207),
                                      onPressed: () {
                                        controller.increamentProduct(data);
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        size: 18,
                                      ))
                                ]),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      right: 0,
                      child: IconButton(
                          onPressed: () {
                            controller.delete(data);
                          },
                          icon: const Icon(Icons.delete_outline)))
                ]),
              ),
            );
          },
        ));
  }
}
