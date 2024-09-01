import 'package:flutter/material.dart';

class ImageWithButtons extends StatelessWidget {
  final String image;
  void Function()? onPressed;

   ImageWithButtons({required this.image ,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            height: 420,
            width: 335,
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 20,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            clipBehavior: Clip.none,
            // Allow the icon to overflow
            child: const Center(
              child: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 40,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
