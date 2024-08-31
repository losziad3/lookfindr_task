import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lookfindr_task/features/home/widgets/categories.dart';
import 'package:lookfindr_task/features/home/widgets/location_drop_down.dart';
import 'package:lookfindr_task/features/home/widgets/popular_cards.dart';
import 'package:lookfindr_task/features/home/widgets/recommended_card.dart';
import 'package:lookfindr_task/features/home/widgets/search_bar.dart';

import '../../../core/utils/assets.dart';
import '../../../core/utils/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final textScaleFactor = mediaQuery.textScaleFactor;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Explore',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset(kLocationIcon),
                    const ChooseLocation(),
                  ],
                ),

                const Text(
                  'Aspen',
                  style: TextStyle(
                    fontSize: 32.0,
                  ),
                ),

                SizedBox(
                  height: screenHeight * .04,
                ),

                //Search
                const Search(),

                SizedBox(
                  height: screenHeight * .04,
                ),
                // Categories
                Categories(),

                Row(
                  children: [
                    const Text(
                      'Popular',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See all',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    PopularCards(
                      screenHeight: screenHeight,
                      image: kImage_1,
                      onTap: (){
                        GoRouter.of(context).push(
                          Routes.kDetailsScreen,
                        );
                      },
                    ),
                    SizedBox(
                      width: screenWidth * .04,
                    ),
                    PopularCards(
                      screenHeight: screenHeight,
                      image: kImage_2,
                      onTap: (){},
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * .03,
                ),
                const Text(
                  'Recommended',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: screenHeight * .01,
                ),
                Row(
                  children: [
                    const RecommendedCard(
                      image: kImage_3,
                      title: 'Explore Aspen',
                      duration: 'Hot Deal',
                    ),
                    SizedBox(
                      width: screenWidth * .03,
                    ),
                    const RecommendedCard(
                      image: kImage_4,
                      title: 'Luxurious Aspen',
                      duration: 'Hot Deal',
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
