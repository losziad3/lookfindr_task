import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lookfindr_task/core/utils/routes.dart';
import 'package:lookfindr_task/features/onboarding/widgets/custom_button.dart';

import '../../../core/utils/assets.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              kBackgroundImage,
              fit: BoxFit.fill,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Text(
                  'Aspen',
                  style: GoogleFonts.pacifico(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20.0,
              bottom: 100.0,
              child: RichText(
                text: const TextSpan(
                  text: 'Plan your\n',
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  children: [
                    TextSpan(
                      text: 'Luxurious\nVacation',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              right: 6,
              left: 6,
              child: CustomButton(
                color: const Color(0xFF1C18F2),
                text: 'Explore',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0
                ),
                onTap: (){
                  GoRouter.of(context).push(
                    Routes.kLayout,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
