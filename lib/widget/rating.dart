import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// ignore: non_constant_identifier_names
Widget Rating(double rate) {
  return SizedBox(
    height: 40,
    child: RatingBarIndicator(
      rating: rate,
      itemSize: 25,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
    ),
  );
}
