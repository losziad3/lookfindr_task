import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lookfindr_task/core/utils/assets.dart';

class RecommendedCard extends StatelessWidget {
  final String image;
  final String title;

  final String duration;

  const RecommendedCard({
    required this.image,
    required this.title,

    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFf0f4f4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                // Row(
                //   children: [
                //     const Icon(Icons.star, color: Colors.yellow),
                //     const Icon(Icons.star, color: Colors.yellow),
                //     const Icon(Icons.star, color: Colors.yellow),
                //     const Icon(Icons.star, color: Colors.yellow),
                //     const Icon(Icons.star_half, color: Colors.yellow),
                //     const SizedBox(width: 4),
                //     Text(rating.toString()),
                //   ],
                // ),
                Row(
                  children: [
                    SvgPicture.asset(kTrendingUp),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(duration),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
