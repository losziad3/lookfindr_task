import 'package:flutter/material.dart';

class HeartIcon extends StatelessWidget {
  final double heightOfHeart;
  final double widthOfHeart;
  final double bottomPosition;
  final double iconSize;
  final void Function()? onTap;
  const HeartIcon({
    super.key, required this.heightOfHeart, required this.widthOfHeart, required this.bottomPosition, required this.iconSize, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottomPosition,
      right: 10,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: heightOfHeart,
          width: widthOfHeart,
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
          child:  Center(
            child: Icon(
              Icons.favorite,
              color: Colors.red,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildStarRating(double rating) {
  List<Widget> stars = [];
  for (int i = 0; i < 1; i++) {
    stars.add(
      Icon(
        i < rating ? Icons.star : Icons.star_border,
        color: Colors.amber,
        size: 16,
      ),
    );
  }
  return Row(children: stars);
}