import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/assets.dart';
import '../../../cubits/layout_cubit/layout_cubit.dart';
import '../../../cubits/layout_cubit/layout_states.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);

        return Scaffold(
          backgroundColor: Colors.white,
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, -3), // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeBottom(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_filled,
                      color: cubit.currentIndex == 0 ? Colors.blue : Colors.grey,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      kTicket,
                      width: 24,
                      height: 24,
                      color: cubit.currentIndex == 1 ? Colors.blue : Colors.grey,
                    ),
                    label: 'Ticket',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      kFavorite,
                      width: 24,
                      height: 24,
                      color: cubit.currentIndex == 2 ? Colors.blue : Colors.grey,
                    ),
                    label: 'Favorite',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      kProfile,
                      width: 24,
                      height: 24,
                      color: cubit.currentIndex == 3 ? Colors.blue : Colors.grey,
                    ),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
