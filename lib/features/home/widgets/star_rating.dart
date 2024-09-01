import 'package:flutter/material.dart';

import '../../../components/components.dart';

class StarRatingComponent extends StatelessWidget {
  final double rating;
  final int reviewCount;


  const StarRatingComponent({
    required this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildStarRating(rating),
        Text(
          '${rating.toStringAsFixed(1)} ($reviewCount Reviews)',
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }


}