import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lookfindr_task/core/utils/app_router.dart';
import 'package:lookfindr_task/cubits/home_screen_cubit/home_screen_cubit.dart';
import 'package:lookfindr_task/data/data_source/data_source.dart';
import 'package:lookfindr_task/data/repository/repository_impl.dart';
import 'package:lookfindr_task/domain/repository/repository.dart';

void main() {
  final Repository repository = RepositoryImplementation(DataSource());

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final Repository repository;

  const MyApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeScreenCubit(repository),
        ),

      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
