import 'package:flutter/material.dart';

class PopularCards extends StatelessWidget {
   PopularCards({
    super.key,
    required this.screenHeight,
   required this.image,
     required this.onTap,
  });

  final double screenHeight;
  String image;
   void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: onTap,
        child: Image.asset(image, height: screenHeight * .27,));
  }
}