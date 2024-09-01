import 'package:flutter/material.dart';
import '../../../components/components.dart';

class PopularCards extends StatelessWidget {
  PopularCards({
    super.key,
    required this.screenHeight,
    required this.image,
    required this.onTap,
    required this.text,
    required this.rating,
    this.showHeartIcon = true,
  });

  final double screenHeight;
  final String image;
  final void Function()? onTap;
  final String text;
  final String rating;
  final bool showHeartIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Image.asset(
            image,
            height: screenHeight * .27,
          ),
          // Conditionally show the HeartIcon based on showHeartIcon
          if (showHeartIcon)
            HeartIcon(
              // If the user clicks on the heart icon, it will be added to the favorite page
              onTap: () {},
              bottomPosition: 5,
              widthOfHeart: 40,
              heightOfHeart: 40,
              iconSize: 22,
            ),
          Positioned(
            bottom: 10,
            left: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF4D5652),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF4D5652),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Row(
                      children: [
                        buildStarRating(2),
                        Text(
                          rating,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
