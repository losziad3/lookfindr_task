import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lookfindr_task/core/utils/routes.dart';
import 'package:lookfindr_task/cubits/home_screen_cubit/home_screen_cubit.dart';
import 'package:lookfindr_task/data/repository/repository_impl.dart';
import 'package:lookfindr_task/domain/repository/repository.dart';
import 'package:lookfindr_task/features/home/presentation/details_screen.dart';

import '../../cubits/layout_cubit/layout_cubit.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/layout/presentatoin/layout_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../data/data_source/data_source.dart';

class AppRouter {
  // Initialize the repository
  static final Repository repository = RepositoryImplementation(DataSource());

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: Routes.kLayout,
        builder: (context, state) => BlocProvider(
          create: (context) => LayoutCubit(),
          child: Layout(),
        ),
      ),
      GoRoute(
        path: Routes.kHomeScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeScreenCubit(repository),
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: Routes.kDetailsScreen,
        builder: (context, state) => const DetailsScreen(),
      ),
    ],
  );
}
