import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lookfindr_task/core/utils/assets.dart';
import 'package:lookfindr_task/features/home/widgets/book_now_button.dart';
import 'package:lookfindr_task/features/home/widgets/image_deatils_screen.dart';
import 'package:lookfindr_task/features/home/widgets/read_more_text.dart';
import 'package:lookfindr_task/features/home/widgets/star_rating.dart';

import '../../onboarding/widgets/custom_button.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final textScaleFactor = mediaQuery.textScaleFactor;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ImageWithButtons(
                  image: kImage_2,
                ),
                SizedBox(
                  height: screenHeight * .027,
                ),
                Row(
                  children: [
                    const Text(
                      'Coeurdes Aples',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Show map',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                const StarRatingComponent(
                  rating: 4.5,
                  reviewCount: 335,
                ),
                SizedBox(height: screenHeight * .02),
                const ReadMoreText(
                  text:
                      'Aspen is as close as one can get to a storybook alpine town in America. The choose-your-own-adventure possibilities—skiing, hiking, dining, shopping and, Aspen is as close as one can get to a storybook alpine town in America. The choose-your-own-adventure possibilities—skiing, hiking, dining, shopping and....',
                ),
                SizedBox(height: screenHeight * .04),
                const Text(
                  'Facilities',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                FeatureButtonRow(
                  buttons: [
                    FeatureButtonData(icon: Icons.wifi, label: '1 Heater'),
                    FeatureButtonData(icon: Icons.restaurant, label: 'Dinner'),
                    FeatureButtonData(icon: Icons.bathtub, label: '1 Tub'),
                    FeatureButtonData(icon: Icons.pool, label: 'Pool'),
                  ],
                ),
                SizedBox(height: screenHeight * .03),
                Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '\$199',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2DD7A4),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    BookNowButton(
                      color: const Color(0xFF176FF2),
                      text: 'Book Now',
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                      onTap: (){

                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FeatureButtonRow extends StatelessWidget {
  final List<FeatureButtonData> buttons;

  const FeatureButtonRow({required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: buttons.map((button) => _buildFeatureButton(button)).toList(),
    );
  }

  Widget _buildFeatureButton(FeatureButtonData button) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            button.icon,
            size: 30,
            color: Colors.grey[700],
          ),
          const SizedBox(height: 4),
          Text(
            button.label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureButtonData {
  final IconData icon;
  final String label;

  FeatureButtonData({required this.icon, required this.label});
}
