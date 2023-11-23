// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:product/method/method.dart';

void dialog(List<String> images, List<File> file, int index) {
  Get.defaultDialog(
    buttonColor: Colors.green,
    middleText: '',
    textCancel: 'Remove',
    textConfirm: 'Replace',
    title: 'What do you want to do?',
    titlePadding: const EdgeInsets.all(20),
    onConfirm: () {
      Get.back();
      Get.bottomSheet(Container(
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: () {
                  Method().pickImage(
                    'gallery',
                    onClicked: (value, file) {
                      images[index] = value;
                    },
                  );
                  Get.back();
                },
                icon: const Icon(Icons.photo)),
            IconButton(
                onPressed: () {
                  Method().pickImage(
                    'camera',
                    onClicked: (value, file) {
                      images[index] = value;
                    },
                  );
                  Get.back();
                },
                icon: const Icon(Icons.camera_alt))
          ],
        ),
      ));
    },
    onCancel: () {
      images.removeAt(index);
      file.removeAt(index);
    },
  );
}

void dailogThumbnail({
  required void Function(String, File) onClicked,
}) {
  Get.defaultDialog(
    title: 'Do you want to replace?',
    titlePadding: const EdgeInsetsDirectional.all(20),
    middleText: '',
    textConfirm: 'Yes',
    textCancel: 'No',
    onConfirm: () {
      Method().pickImage(
        'gallery',
        onClicked: onClicked,
      );
      Get.back();
    },
    onCancel: () {},
  );
}

Widget addGallery(
  String thumbnail,
  List<File> listFile,
  File file,
  List<String> listImages,
  double sizeheigth,
  double sizewidth, {
  required void Function(List<String>, String, File?, List<File>) onClicked,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 5, right: 3.5),
    child: GestureDetector(
      onTap: () {
        Method().selectedImage(
            fileImage: file, thumbnailImage: thumbnail, onClicked: onClicked);
      },
      child: Container(
        height: sizeheigth,
        width: sizewidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 223, 223, 223),
        ),
        child: const Icon(
          Icons.add_circle_outline,
          color: Colors.grey,
          size: 30,
        ),
      ),
    ),
  );
}

Widget gallery(List<String> images, List<File> file, int index,
    double sizeheigth, double sizewidth) {
  return Padding(
    padding: const EdgeInsets.only(top: 5, right: 3.5),
    child: GestureDetector(
      onTap: () {
        dialog(images, file, index);
      },
      child: Container(
        height: sizeheigth,
        width: sizewidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: MemoryImage(base64Decode(images[index])),
                fit: BoxFit.cover)),
      ),
    ),
  );
}

Widget gallaryImage(
  String thumbnail,
  List<File> listFile,
  File file,
  List<String> listImage, {
  required void Function(List<String>, String, File?, List<File>) onClicked,
}) {
  return SizedBox(
    height: 290,
    child: Column(
      children: [
        GestureDetector(
          onTap: () {
            dailogThumbnail(
              onClicked: (value, file) {
                onClicked([], value, file, []);
              },
            );
          },
          child: thumbnail.isEmpty
              ? addGallery(thumbnail, listFile, file, listImage, 190, Get.width,
                  onClicked: onClicked)
              : Container(
                  height: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: MemoryImage(base64Decode(thumbnail)),
                        fit: BoxFit.cover),
                  ),
                ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: listImage.length < 4 ? 4 : listImage.length + 1,
            itemBuilder: (context, index) {
              return listImage.length < 4 && listImage.length <= index
                  ? addGallery(thumbnail, listFile, file, listImage, 90, 90,
                      onClicked: onClicked)
                  : index == 0 && listImage.length > 3
                      ? addGallery(thumbnail, listFile, file, listImage, 90, 90,
                          onClicked: onClicked)
                      : gallery(listImage, listFile,
                          listImage.length > 3 ? index - 1 : index, 90, 90);
            },
          ),
        )
      ],
    ),
  );
}
// return Obx(
  //   () => SizedBox(
  //     height: 280,
  //     width: Get.width,
  //     child: StaggeredGrid.count(
  //       crossAxisCount: 4,
  //       mainAxisSpacing: 4,
  //       crossAxisSpacing: 4,
  //       children: List.generate(
  //         images.length,
  //         (index) {
  //           return StaggeredGridTile.count(
  //             crossAxisCellCount: index == 0 ? 4 : 1,
  //             mainAxisCellCount: index == 0 ? 2 : 1,
  //             child: GestureDetector(
  //               onTap: () {
  //                 Method().selectedimage(
  //                   onClicked: (value, image, file, lsfile) {
  //                     onClicked(value, image, file, lsfile);
  //                   },
  //                 );
  //               },
  //               child: index == images.length - 1
  //                   ? Container(
  //                       decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(15),
  //                           border: Border.all(width: 2, color: Colors.grey)),
  //                       child: const Icon(
  //                         Icons.add_circle_outline,
  //                         size: 40,
  //                         color: Colors.grey,
  //                       ),
  //                     )
  //                   : GestureDetector(
  //                       onTap: () {
  //                         Get.defaultDialog(
  //                           buttonColor: Colors.green,
  //                           middleText: '',
  //                           textCancel: 'Remove',
  //                           textConfirm: 'Replace',
  //                           title: 'What do you want to do?',
  //                           titlePadding: const EdgeInsets.all(20),
  //                           onConfirm: () {
  //                             Get.back();
  //                             Get.bottomSheet(Container(
  //                               height: 80,
  //                               color: Colors.white,
  //                               child: Row(
  //                                 mainAxisAlignment:
  //                                     MainAxisAlignment.spaceAround,
  //                                 children: [
  //                                   IconButton(
  //                                       onPressed: () {
  //                                         Method().getimage(
  //                                           'gallery',
  //                                           onClicked: (value) {
  //                                             images[index + 1] = value;
  //                                           },
  //                                         );
  //                                       },
  //                                       icon: const Icon(Icons.photo)),
  //                                   IconButton(
  //                                       onPressed: () {
  //                                         Method().getimage(
  //                                           'camera',
  //                                           onClicked: (value) {
  //                                             images[index + 1] = value;
  //                                           },
  //                                         );
  //                                       },
  //                                       icon: const Icon(Icons.camera_alt))
  //                                 ],
  //                               ),
  //                             ));
  //                           },
  //                           onCancel: () {
  //                             images.removeAt(index + 1);
  //                           },
  //                         );
  //                       },
  //                       child: Container(
  //                         decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(15),
  //                           image: DecorationImage(
  //                               image: MemoryImage(
  //                                 base64Decode(images[index + 1]),
  //                               ),
  //                               fit: BoxFit.cover),
  //                         ),
  //                       ),
  //                     ),
  //             ),
  //           );
  //         },
  //       ),
  //     ),
  //   ),
  // );
// class ScrollImage extends GetView<PaymentController> {
//   const ScrollImage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => SizedBox(
//           height: 250,
//           width: Get.width,
//           child: ListView.builder(
//             physics: const BouncingScrollPhysics(),
//             scrollDirection: Axis.horizontal,
//             itemCount: controller.listimage.length,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.all(4.0),
//                 child: index == 0
//                     ? GestureDetector(
//                         onTap: () {
//                           Method().selectedimage(
//                onClicked: (value) {
//                  onClicked(value);
//                },
//               );
//                         },
//                         child: Container(
//                           height: 250,
//                           width: 180,
//                           decoration: BoxDecoration(
//                             color: const Color.fromARGB(255, 218, 218, 218),
//                             borderRadius: BorderRadius.circular(15),
//                           ),
//                           child: const Icon(
//                             Icons.add_circle_outline,
//                             size: 40,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       )
//                     : GestureDetector(
//                         onTap: () {
//                           Get.defaultDialog(
//                             buttonColor: Colors.green,
//                             middleText: '',
//                             textCancel: 'Remove',
//                             textConfirm: 'Replace',
//                             title: 'What do you want to do?',
//                             titlePadding: const EdgeInsets.all(20),
//                             onConfirm: () {
//                               Method().getimage(
//                                 onClicked: (image) {
//                                   controller.listimage[index] = image;
//                                 },
//                               );
//                               Get.back();
//                             },
//                             onCancel: () {
//                               controller.removeimage(index);
//                             },
//                           );
//                         },
//                         child: Container(
//                           height: 250,
//                           width: 180,
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(15),
//                               image: DecorationImage(
//                                   image: MemoryImage(base64Decode(
//                                       controller.listimage[index])),
//                                   fit: BoxFit.fill)),
//                         ),
//                       ),
//               );
//             },
//           ),
//         ));
//   }
// }

