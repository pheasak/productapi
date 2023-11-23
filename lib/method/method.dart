// ignore_for_file: file_names, avoid_print

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Method {
  //DateTime dateTime = DateTime.now();
  List<File> file = [];
  List<Uint8List> bytes = [];
  List<String> base64 = [];

  void pickImage(
    String type, {
    required void Function(String, File) onClicked,
  }) async {
    var image = await ImagePicker().pickImage(
        source: type == "gallery" ? ImageSource.gallery : ImageSource.camera);
    if (image == null) return;
    File file = File(image.path);
    Uint8List bytes = file.readAsBytesSync();
    onClicked(base64Encode(bytes), file);
  }

  // ignore: non_constant_identifier_names, use_function_type_syntax_for_parameters
  void selectedImage({
    required void Function(List<String>, String, File, List<File>) onClicked,
    required String thumbnailImage,
    required File fileImage,
  }) async {
    List<XFile> image = await ImagePicker().pickMultiImage();
    String thumbnailBase64 = thumbnailImage;
    File thumbnailFile = fileImage;
    if (image.isNotEmpty) {
      image.map((e) => file.add(File(e.path))).toList();
      file.map((e) => bytes.add(e.readAsBytesSync())).toList();
      bytes.map((e) => base64.add(base64Encode(e))).toList();

      if (thumbnailImage.isEmpty) {
        thumbnailBase64 = base64.first;
        thumbnailFile = file.first;
        base64.removeAt(0);
        file.removeAt(0);
      }
      onClicked(base64, thumbnailBase64, thumbnailFile, file);
    }
  }

  void pickDateTime(
    BuildContext context, {
    required void Function(DateTime) onClicked,
  }) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1800),
            lastDate: DateTime(2050))
        .then((value) => onClicked(value!));
  }
}
