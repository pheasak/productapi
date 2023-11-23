import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class TitleText extends StatelessWidget {
  String title;

  TitleText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
