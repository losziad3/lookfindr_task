import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lookfindr_task/core/utils/routes.dart';
import 'package:lookfindr_task/cubits/home_screen_cubit/home_screen_cubit.dart';
import 'package:lookfindr_task/cubits/home_screen_cubit/home_screen_state.dart';
import 'package:lookfindr_task/features/home/widgets/popular_cards.dart';

class PopularItems extends StatelessWidget {
  const PopularItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomePageState>(

      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.errorMessage != null) {
          return Center(child: Text('Error: ${state
              .errorMessage}'));
        }
        else if (state.homeScreenData == null || state.homeScreenData!.popular.isEmpty) {
          return const Center(child: Text('No data available'));
        }
        else {
          final popularItems = state.homeScreenData!.popular;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: popularItems.map((item) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: PopularCards(
                    rating: item.rating.toString(),
                    text: item.name,
                    screenHeight: 200,
                    image: item.image,
                    onTap: () {
                      GoRouter.of(context).push(
                        Routes.kDetailsScreen,
                        extra: item,
                      );
                    },
                  ),
                );
              }).toList(),
            ),
          );
        }
      },
    );
  }
}
