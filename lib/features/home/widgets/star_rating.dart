import 'package:flutter/material.dart';

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
        _buildStarRating(rating),
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

  Widget _buildStarRating(double rating) {
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
}