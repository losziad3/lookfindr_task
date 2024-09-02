import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lookfindr_task/cubits/home_screen_cubit/home_screen_cubit.dart';
import 'package:lookfindr_task/cubits/home_screen_cubit/home_screen_state.dart';
import 'package:lookfindr_task/features/home/widgets/categories.dart';
import 'package:lookfindr_task/features/home/widgets/location_drop_down.dart';
import 'package:lookfindr_task/features/home/widgets/popular_cards.dart';
import 'package:lookfindr_task/features/home/widgets/popular_items.dart';
import 'package:lookfindr_task/features/home/widgets/recommended_card.dart';
import 'package:lookfindr_task/features/home/widgets/recommended_items.dart';
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

    context.read<HomeScreenCubit>().fetchPopularAndRecommended();
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

                //Popular Items
                const PopularItems(),

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

                //Recommended
                const RecommendedItems(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


