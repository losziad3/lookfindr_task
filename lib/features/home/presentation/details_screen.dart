import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lookfindr_task/core/utils/assets.dart';
import 'package:lookfindr_task/cubits/home_screen_cubit/home_screen_cubit.dart';
import 'package:lookfindr_task/cubits/home_screen_cubit/home_screen_state.dart';
import 'package:lookfindr_task/features/home/widgets/book_now_button.dart';
import 'package:lookfindr_task/features/home/widgets/facilities_icon.dart';
import 'package:lookfindr_task/features/home/widgets/image_deatils_screen.dart';
import 'package:lookfindr_task/features/home/widgets/read_more_text.dart';
import 'package:lookfindr_task/features/home/widgets/star_rating.dart';

import '../../../core/utils/routes.dart';
import '../../onboarding/widgets/custom_button.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    context.read<HomeScreenCubit>().fetchDetails();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: BlocBuilder<HomeScreenCubit, HomePageState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.errorMessage != null) {
                  return Center(child: Text('Error: ${state
                      .errorMessage}'));
                }
                else if (state.detailScreenData == null || state.detailScreenData!.isEmpty) {
                  return const Center(child: Text('No data available'));
                }
                else {
                  // Assume we open the last item in the list
                  final detail = state.detailScreenData!.last;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImageWithButtons(
                        image: detail.image,
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                      ),
                      SizedBox(
                        height: screenHeight * .027,
                      ),
                      Row(
                        children: [
                           Text(
                            detail.name,
                            style: const TextStyle(
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
                       StarRatingComponent(
                        rating: detail.rating,
                        reviewCount: detail.reviews,
                      ),
                      SizedBox(height: screenHeight * .02),
                       ReadMoreText(
                        text: detail.description
                      ),
                      SizedBox(height: screenHeight * .04),
                      const Text(
                        'Facilities',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * .02,
                      ),
                      FeatureButtonRow(
                        buttons: [
                          FacilitiesIcons(
                              icon: SvgPicture.asset(kHeater),
                              label: '1 Heater'),
                          FacilitiesIcons(
                              icon: SvgPicture.asset(kDinner), label: 'Dinner'),
                          FacilitiesIcons(
                              icon: SvgPicture.asset(kTub), label: '1 Tub'),
                          FacilitiesIcons(
                              icon: SvgPicture.asset(kPool), label: 'Pool'),
                        ],
                      ),
                      SizedBox(height: screenHeight * .03),
                      Row(
                        children: [
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Price',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '\$${detail.price}',
                                style: const TextStyle(
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
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
